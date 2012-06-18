class RemovePriorityIdFromActivities < ActiveRecord::Migration
  def up
    remove_column :activities, :priority_id
      end

  def down
    add_column :activities, :priority_id, :integer
  end
end
