class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :body, presence: true
  validates :username, presence: true, unless: -> { user.present? }

  def username
    user&.name || super
  end
end
