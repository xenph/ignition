class Project < ActiveRecord::Base
  attr_accessible :description, :goal, :title, :goal_type, :slug, :author
  has_many :pledges
  has_many :users, :through => :pledges
  belongs_to :user
  
  def html_description
    BlueCloth.new(description).to_html
  end

end
