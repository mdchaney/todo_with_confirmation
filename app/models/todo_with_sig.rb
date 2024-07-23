class TodoWithSig < ApplicationRecord
  normalizes :body, with: ->(value) { value.strip }

  def as_signable_string
    attributes.except("signature").values.map(&:to_s).join
  end

  def self.sign(signable_string)
    Digest::SHA2.new(512).hexdigest(signable_string + Rails.application.secret_key_base + "some other stuff")
  end

  def signature
    self.class.sign(as_signable_string)
  end

  def verify_signature(signature)
    self.signature == signature
  end

  validates :body, presence: true, length: { maximum: 100 }
end
