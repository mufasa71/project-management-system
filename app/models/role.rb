class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates_presence_of :name
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

