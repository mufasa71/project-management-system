class RenameTasksMembersToMembersTasks < ActiveRecord::Migration
  def change
    rename_table :tasks_members, :members_tasks
  end
end
