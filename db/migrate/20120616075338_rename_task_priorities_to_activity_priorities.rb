class RenameTaskPrioritiesToActivityPriorities < ActiveRecord::Migration
  def change
    rename_table :task_priorities, :activity_priorities
  end
end
