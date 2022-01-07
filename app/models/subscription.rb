class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  before_validation :email_downcase

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, unless: -> { user.present? }
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }
  validate :not_own_event, if: -> { user.present? }
  validate :email_is_not_taken, unless: -> { user.present? }

  def user_name
    user&.name || super
  end

  def user_email
    user&.email || super
  end

  private

  def email_downcase
    user_email&.downcase!
  end

  def not_own_event
    errors.add(:user, :taken) if event.user == user
  end

  def email_is_not_taken
    errors.add(:user_email, :taken) if User.find_by(email: user_email)
  end
end
