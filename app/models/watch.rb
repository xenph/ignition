class Watch < ActiveRecord::Base
  attr_accessible :project, :project_id, :user, :user_id
  belongs_to :user
  belongs_to :project
end
