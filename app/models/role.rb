class Role < ActiveRecord::Base
  has_many :member_roles, :dependent => :destroy
  has_many :members, :through => :member_roles

  before_destroy :check_deletable


  BUILTIN_NON_MEMBER = 1
  BUILTIN_ANONYMOUS = 2

  ISSUES_VISIBILTY_OPTIONS = [
      ['all', :label_issues_visibility_all], 
      ['default', :label_issues_visibility_public], 
      ['own', :label_issues_visibility_own]
  ]

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 30
  validates_inclusion_of :issues_visibility,
    :in => ISSUES_VISIBILTY_OPTIONS.collect(&:first), 
    :if => lambda {|role| role.respond_to?(:issues_visibility)}

  private
    def check_deletable
      raise "Can't delete role" if members.any?
    end
end
# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

