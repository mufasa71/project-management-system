class IssueStatus < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 30


  NEW = 1
  IN_PROGRESS = 2
  RESOLVED = 3
  FEEDBACK = 4
  CLOSED = 5
  REJECTED = 6

  def to_s
    name
  end
end
# == Schema Information
#
# Table name: issue_statuses
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

