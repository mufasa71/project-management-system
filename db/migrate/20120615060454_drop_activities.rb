class DropActivities < ActiveRecord::Migration
  def up
    drop_table :activities
  end
end
