class Milestone < ActiveRecord::Base
  belongs_to :issue
  belongs_to :project

  validates_presence_of :description, :issue, :project
end
