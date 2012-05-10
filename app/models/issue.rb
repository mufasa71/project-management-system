class Issue < ActiveRecord::Base
  belongs_to :project
  belongs_to :status, :class_name => 'IssueStatus', :foreign_key => 'status_id'
  belongs_to :priority, :class_name => 'IssuePriority', :foreign_key => 'priority_id'
  validates_presence_of :subject, :status, :priority, :project
end
# == Schema Information
#
# Table name: issues
#
#  id               :integer         not null, primary key
#  project_id       :integer
#  tracker_id       :integer
#  status_id        :integer
#  author_id        :integer
#  assigned_to_id   :integer
#  fixed_version_id :integer
#  priority_id      :integer
#  category_id      :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  start_date       :date
#  due_date         :date
#  estimated_time   :integer
#  done             :integer
#  file             :string(255)
#

