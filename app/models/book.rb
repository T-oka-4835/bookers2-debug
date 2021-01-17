class Book < ApplicationRecord
	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	attachment :image

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	# 通知機能
  has_many :notifications, dependent: :destroy

  def create_notification_like?(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and book_id = ? and action = ?", current_user.id, user_id, id, "favorite"])

    if temp.blank?
      notification = current_user.active_notifications.new(
      	book_id: id,
      	visited_id: user_id,
      	action: "favorite"
      	)

    if notification.visitor_id == notification.visited_id
       notification.checked = true
    end
       notification.save if notification.valid?
    end
  end

  def create_notification_post_comment!(current_user, post_comment_id)
    save_notification_comment!(current_user, post_comment_id, user_id)
  end

  def save_notification_comment!(current_user, post_comment_id, visited_id)
      notification = current_user.active_notifications.new(
      book_id: id,
      post_comment_id: post_comment_id,
      visited_id: visited_id,
      action: "comment"
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
  end

end
