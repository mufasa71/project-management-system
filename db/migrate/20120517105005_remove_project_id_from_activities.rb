class RemoveProjectIdFromActivities < ActiveRecord::Migration
  def up
    remove_column :activities, :project_id
      end

  def down
    add_column :activities, :project_id, :integer
  end
end
