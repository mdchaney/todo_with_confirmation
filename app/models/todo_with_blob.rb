class TodoWithBlob < ApplicationRecord
  normalizes :body, with: ->(value) { value.strip }

  def self.encryptor
    @encryptor ||=
      begin
        salt = "very salty salt"
        key_gen = ActiveSupport::KeyGenerator.new(Rails.application.credentials.secret_key_base, iterations: 1000)
        secret = key_gen.generate_key(salt,32)
        @encryptor = ActiveSupport::MessageEncryptor.new(secret)
      end
  end

  def as_encrypted_blob
    self.class.encryptor.encrypt_and_sign(attributes.except("id", "created_at", "updated_at").to_json)
  end

  def self.from_encrypted_blob(encrypted_blob)
    new(JSON.parse(encryptor.decrypt_and_verify(encrypted_blob)))
  end

  validates :body, presence: true, length: { maximum: 100 }
end
