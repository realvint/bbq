class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  before_validation :set_name, on: :create

  has_many :events

  validates :name, presence: true, length: { maximum: 35 }

  private

  def set_name
    self.name = "Тайный спрашиватель №#{rand(999)}" if self.name.blank?
  end
end
