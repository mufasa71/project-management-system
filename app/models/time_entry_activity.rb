class TimeEntryActivity < ActiveRecord::Base
  has_many :time_entries, :foreign_key => 'activity_id'
end
