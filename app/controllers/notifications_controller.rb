class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def update
    notification = current_user.notifications.find(params[:id])   # ログインしているユーザーに紐づく通知レコードから、指定のidのレコードを取得
    notification.update(read: true)     # 取得した通知レコードのreadカラムをtrueに更新=既読状態に変更
    redirect_to notification.notifiable_path    # 通知内容の種類に応じたリダイレクト先にリダイレクト
  end
end
