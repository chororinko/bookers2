class Favorite < ApplicationRecord

  belongs_to :book
  belongs_to :user
  has_one :notification, as: :notifiable, dependent: :destroy

  after_create do
    create_notification(user_id: book.user_id)
  end

  validates :user_id, uniqueness: { scope: :book_id }
end
