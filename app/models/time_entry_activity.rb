class TimeEntryActivity < ActiveRecord::Base
  has_many :time_entries, :foreign_key => 'activity_id'
end
# == Schema Information
#
# Table name: time_entry_activities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  active     :boolean
#

