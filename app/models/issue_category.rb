class IssueCategory < ActiveRecord::Base
  belongs_to :project
  belongs_to :assigned_to, :class_name => 'Member', :foreign_key => 'assigned_to_id'
  has_many :issues, :foreign_key => 'category_id', :dependent => :nullify

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:project_id]
  validates_length_of :name, :maximum => 30

  def to_s
    name
  end
end
# == Schema Information
#
# Table name: issue_categories
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  project_id     :integer
#  assigned_to_id :integer
#

