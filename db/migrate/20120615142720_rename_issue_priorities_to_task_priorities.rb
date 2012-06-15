class RenameIssuePrioritiesToTaskPriorities < ActiveRecord::Migration
  def change
    rename_table :issue_priorities, :task_priorities
  end
end
