class Report < ActiveRecord::Base
  belongs_to :project
  serialize :activities
  validates_presence_of :prepared_by, :description, :comments
end
