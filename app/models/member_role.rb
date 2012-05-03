class MemberRole < ActiveRecord::Base
  belongs_to :member
  belongs_to :role

  validates_presence_of :role
end
# == Schema Information
#
# Table name: member_roles
#
#  id         :integer         not null, primary key
#  member_id  :integer
#  role_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

