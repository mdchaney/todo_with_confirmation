class TodoWithPlease < ApplicationRecord
  normalizes :body, with: ->(value) { value.strip }

  validates :body, presence: true, length: { maximum: 100 }
end
