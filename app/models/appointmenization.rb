class Appointmenization < ActiveRecord::Base
  belongs_to :member
  belongs_to :appointment
end
# == Schema Information
#
# Table name: appointmenizations
#
#  id             :integer         not null, primary key
#  appointment_id :integer
#  member_id      :integer
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

