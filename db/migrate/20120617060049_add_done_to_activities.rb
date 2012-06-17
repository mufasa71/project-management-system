class AddDoneToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :done, :boolean, :default => false
  end
end
