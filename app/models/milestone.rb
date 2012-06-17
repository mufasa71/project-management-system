class Milestone < ActiveRecord::Base
  belongs_to :phase
  belongs_to :project
  validates_presence_of :description, :project, :phase
end
# == Schema Information
#
# Table name: milestones
#
#  id          :integer         not null, primary key
#  description :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  phase_id    :integer
#  project_id  :integer
#

