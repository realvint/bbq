class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :events

  validates :name, presence: true, length: { maximum: 35 }
end
