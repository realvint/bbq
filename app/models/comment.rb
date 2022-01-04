class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :body, presence: true
  validates :username, presence: true, unless: -> { user.present? }

  def username
    if user.present?
      user.name
    else
      super
    end
  end
end
