class Milestone < ActiveRecord::Base
  belongs_to :issue
  belongs_to :project

  validates_presence_of :description, :issue, :project
end
# == Schema Information
#
# Table name: milestones
#
#  id          :integer         not null, primary key
#  description :string(255)
#  issue_id    :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  project_id  :integer
#

