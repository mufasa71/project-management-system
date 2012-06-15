class Task < ActiveRecord::Base
  belongs_to :activity
  belongs_to :status, :class_name => 'TaskStatus', :foreign_key => 'status_id'
  belongs_to :priority, :class_name => 'TaskPriority', :foreign_key => 'priority_id'
  belongs_to :assigned_to, :class_name => 'Member', :foreign_key => 'assigned_to_id'
  has_many :attachments, :as => :attachable
  has_one :event, :as => :eventable, :dependent => :destroy
  validates_presence_of :subject, :status, :priority

  accepts_nested_attributes_for :event

  accepts_nested_attributes_for :attachments

  def to_s
    subject
  end
end
# == Schema Information
#
# Table name: tasks
#
#  id          :integer         not null, primary key
#  activity_id :integer
#  status_id   :integer
#  priority_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  file        :string(255)
#  subject     :string(255)
#  description :text
#

