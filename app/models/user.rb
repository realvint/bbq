class User < ApplicationRecord
  has_many :events

  validates :name, presence: true, length: { maximum: 35 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
