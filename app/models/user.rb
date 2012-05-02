class User < ActiveRecord::Base
  has_many :pledges
  has_many :events
  has_many :comments
  has_many :watches
  has_many :projects, :through => :watches
  has_many :projects, :through => :pledges
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :event_read_count
  # attr_accessible :title, :body
  
  def image_url
    Gravatar.new(email).image_url
  end
  
  def username
    name == "" ? email : name
  end
  
  def notifications
    watched_projects = watches.select('project_id')
    events = Event.where('user_id != ?', id).where(:project_id => watched_projects).desc
  end
  
  def new_notification_count
    notifications.reject{ |value| value.id < event_read_count }.count
  end
  
end
