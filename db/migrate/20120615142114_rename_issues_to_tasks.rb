class RenameIssuesToTasks < ActiveRecord::Migration
  def change
    rename_table :issues, :tasks
  end
end
