class RenameMembersTasks < ActiveRecord::Migration
  def change
    rename_table :members_tasks, :members_activities
    rename_column :members_activities, :task_id, :activity_id
  end
end
