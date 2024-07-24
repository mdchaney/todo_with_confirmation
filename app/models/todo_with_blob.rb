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

  def as_json_string
    attributes.except("id", "created_at", "updated_at").to_json
  end

  def as_encrypted_blob
    self.class.encryptor.encrypt_and_sign(self.as_json_string)
  end

  def self.encrypted_blob_to_json(encrypted_blob)
    JSON.parse(encryptor.decrypt_and_verify(encrypted_blob))
  end

  def self.from_encrypted_blob(encrypted_blob)
    new(encrypted_blob_to_json(encrypted_blob))
  end

  validates :body, presence: true, length: { maximum: 100 }
end
