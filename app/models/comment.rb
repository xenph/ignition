class Comment < ActiveRecord::Base
  attr_accessible :event, :comment, :event_id
  belongs_to :user
  belongs_to :event
end