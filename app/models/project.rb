class Project < ActiveRecord::Base
  validates_presence_of :name, :identifier, :due_date
  validates_uniqueness_of :identifier
  validates_length_of :name, :maximum => 255
  validates_length_of :homepage, :maximum => 255
  validates_length_of :identifier, :maximum => 255
  validates_exclusion_of :identifier, :in => %w(new)

  has_many :groups, :dependent => :destroy
  has_many :members, :include => [:user, :roles]
  has_many :issues, :dependent => :destroy
  has_many :issue_categories, :dependent => :destroy, :order => "#{IssueCategory.table_name}.name"
  has_many :news, :dependent => :destroy, :order => 'created_at DESC'
  has_many :attachments, :dependent => :destroy, :as => :attachable
  has_many :roles, :dependent => :destroy
  has_many :milestones, :dependent => :destroy
  has_many :appointments, :dependent => :destroy

  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :groups
  accepts_nested_attributes_for :roles

  def total_hours
    sum = 0
    issues.each do |issue|
      sum += issue.time_entries.sum(:hours)
    end
    sum
  end

  def to_s
    name
  end
end
# == Schema Information
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  identifier  :string(255)
#  homepage    :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  description :text
#  is_public   :boolean         default(TRUE)
#  due_date    :date
#

