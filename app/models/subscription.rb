class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  before_validation :email_downcase

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, unless: -> { user.present? }
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }
  validate :self_event, if: -> { user.present? }
  validate :email_exist, unless: -> { user.present? }

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

  def self_event
    errors.add(:user, :error_self_event) if event.user == user
  end

  def email_exist
    errors.add(:user_email, :error_email_exist) if User.find_by(email: user_email)
  end
end
