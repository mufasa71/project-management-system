class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :project
  has_many :member_roles, :dependent => :destroy
  has_many :roles, :through => :member_roles
  has_many :appointmenizations
  has_many :appointments, :through => :appointmenizations

  validates_presence_of :project
  validates_uniqueness_of :user_id, :scope => :project_id

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
#  group_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  project_id :integer
#

