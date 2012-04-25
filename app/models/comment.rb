class Comment < ActiveRecord::Base
  attr_accessible :project, :comment, :project_id
  belongs_to :user
  belongs_to :project
end