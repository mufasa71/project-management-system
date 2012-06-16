class RenameTaskStatusesToActivityStatuses < ActiveRecord::Migration
  def change
    rename_table :task_statuses, :activity_statuses
  end
end
