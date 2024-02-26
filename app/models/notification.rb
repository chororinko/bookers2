class Notification < ApplicationRecord
  include Rails.application.routes.url_helpers    # モデルの中でxxx_pathメソッドを使用するために必要な記述

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  def message
    if notifiable_type === "Book"
      "フォローしている#{notifiable.user.name}さんが#{notifiable.title}を投稿しました"
    elsif notifiable_type === "Favorite"
      "投稿した#{notifiable.book.title}が#{notifiable.user.name}さんにいいねされました"
    else
      "投稿した#{notifiable.book.title}に#{notifiable.user.name}さんがコメントしました"
    end
  end

  def notifiable_path
    if self.notifiable_type === "Book"
      book_path(self.notifiable.id)    # 投稿に対する通知の場合はBookの詳細ページへ
    elsif notifiable_type === "Favorite"
      user_path(self.notifiable.user.id)     # いいねに対する通知の場合はいいねをしたUserの詳細ページへ
    else
      book_path(self.notifiable.book.id)    # コメントに対する通知の場合はコメントをしたBookの詳細ページへ
    end
  end

end
