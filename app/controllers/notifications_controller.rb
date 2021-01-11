class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.where(checked: false)
      @notifications.each do |notification|
        notification.update_attributes(checked: true)
    end
  end
end
