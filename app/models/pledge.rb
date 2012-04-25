class Pledge < ActiveRecord::Base
  attr_accessible :project, :amount, :project_id
  validates_numericality_of :amount, :message => "must be a number", :only_integer => true, :greater_than_or_equal_to => 0
  belongs_to :user
  belongs_to :project
end
