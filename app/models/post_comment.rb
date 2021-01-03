class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :book

# 通知機能
　has_many :notifications, dependent: :destroy

end
