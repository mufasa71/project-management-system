class Issue < ActiveRecord::Base
  belongs_to :project
  belongs_to :status, :class_name => 'IssueStatus', :foreign_key => 'status_id'
  belongs_to :priority, :class_name => 'IssuePriority', :foreign_key => 'priority_id'
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :assigned_to, :class_name => 'Member', :foreign_key => 'assigned_to_id'
  belongs_to :category, :class_name => 'IssueCategory', :foreign_key => 'category_id'
  has_many :attachments, :as => :attachable
  has_many :time_entries, :dependent => :destroy
  has_one :milestone, :dependent => :destroy
  has_one :event, :as => :eventable, :dependent => :destroy
  validates_presence_of :subject, :status, :priority, :project

  attr_accessor :time_entry
  accepts_nested_attributes_for :event

  def time_entry=(t)
    time_entries << TimeEntry.create(t) unless t.nil?
  end

  accepts_nested_attributes_for :attachments

  def to_s
    subject
  end

  def total_on(date)
    time_entries.where("date(created_at) = ?", date).sum(:hours)
  end

  def total
    time_entries.sum(:hours)
  end
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
#  due_date         :date
#  estimated_time   :integer
#  done             :integer
#  file             :string(255)
#  subject          :string(255)
#  description      :text
#

