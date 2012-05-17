class Project < ActiveRecord::Base
  validates_presence_of :name, :identifier
  validates_uniqueness_of :identifier
  validates_length_of :name, :maximum => 255
  validates_length_of :homepage, :maximum => 255
  validates_length_of :identifier, :maximum => 255
  validates_exclusion_of :identifier, :in => %w(new)

  has_many :members, :include => [:user, :roles]
  has_many :memberships, :class_name => 'Member'
  has_many :users, :through => :members
  has_many :issues, :dependent => :destroy
  has_many :issue_categories, :dependent => :destroy, :order => "#{IssueCategory.table_name}.name"
  has_many :news, :dependent => :destroy, :order => 'created_at DESC'
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
#

