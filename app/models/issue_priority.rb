class IssuePriority < ActiveRecord::Base
  has_many :issues, :foreign_key => 'priority_id'
  validates_presence_of :name
end
