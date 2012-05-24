class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :member_roles, :dependent => :destroy
  has_many :roles, :through => :member_roles

  validates_presence_of :group
  validates_uniqueness_of :user_id, :scope => :group_id

  def to_s
    user.name
  end
end
# == Schema Information
#
# Table name: members
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

