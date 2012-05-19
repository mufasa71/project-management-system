class AddActiveToTimeEntryActivities < ActiveRecord::Migration
  def change
    add_column :time_entry_activities, :active, :boolean

  end
end
