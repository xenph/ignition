class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
  end
  
  def show
    current_user.event_read_count = Event.all.count
    current_user.save
  end
end