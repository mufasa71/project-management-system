class CreateTimeEntryActivities < ActiveRecord::Migration
  def change
    create_table :time_entry_activities do |t|
      t.string :name

      t.timestamps
    end
  end
end
