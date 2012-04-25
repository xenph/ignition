class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :comments
  scope :desc, order('created_at DESC')
  
  def self.record project, user, description
    event = Event.new
    event.project = project
    event.user = user
    event.description = description
    event.save
  end
end