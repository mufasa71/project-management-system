class ChangeDatetimeToDateInEvents < ActiveRecord::Migration
  def up
    change_column :events, :start_at, :date
    change_column :events, :end_at, :date
  end

  def down
  end
end
