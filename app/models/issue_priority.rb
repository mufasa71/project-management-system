class IssuePriority < ActiveRecord::Base
  has_many :issues, :foreign_key => 'priority_id'
  validates_presence_of :name
end
# == Schema Information
#
# Table name: issue_priorities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

