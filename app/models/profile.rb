class Profile < ActiveRecord::Base
  belongs_to :user
  attr_protected :user_id
end
# == Schema Information
#
# Table name: profiles
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  skype      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#

