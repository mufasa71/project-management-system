class Activity < ActiveRecord::Base
  belongs_to :phase
  belongs_to :status, :class_name => 'ActivityStatus', :foreign_key => 'status_id'
  belongs_to :assignee, :class_name => 'Member', :foreign_key => 'member_id'
  has_many :attachments, :as => :attachable
  has_one :event, :as => :eventable, :dependent => :destroy
  accepts_nested_attributes_for :event
  accepts_nested_attributes_for :attachments
  validates_presence_of :title, :phase, :status, :event, :assignee
end
# == Schema Information
#
# Table name: activities
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  phase_id    :integer
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  status_id   :integer
#  priority_id :integer
#  file        :string(255)
#  member_id   :integer
#  done        :boolean         default(FALSE)
#

