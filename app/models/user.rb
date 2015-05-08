class User < ActiveRecord::Base
  has_many :pledges
  has_many :events
  has_many :comments
  has_many :projects, :through => :pledges
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def image_url
    Gravatar.new(email).image_url
  end
  
  def username
    name == "" ? email : name
  end
  
end
