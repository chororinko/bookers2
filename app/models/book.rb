class Book < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :book_comments, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy

  after_create do
    user.followers.each do |follower|
      notifications.create(user_id: follower.id)
    end
  end

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(content, search)
    if search == "perfect_match"
      Book.where("title LIKE?", "#{content}")
    elsif search == "forward_match"
      Book.where("title LIKE?", "#{content}%")
    elsif search == "backward_match"
      Book.where("title LIKE?", "%#{content}")
    else
      Book.where("title LIKE?", "%#{content}%")
    end
  end
end
