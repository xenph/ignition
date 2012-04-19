class Project < ActiveRecord::Base
  attr_accessible :description, :goal, :title, :goal_type, :slug, :author
  has_many :pledges
  has_many :users, :through => :pledges
  belongs_to :user
end
