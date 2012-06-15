class RenameIssueStatusesToTaskStatuses < ActiveRecord::Migration
  def change
    rename_table :issue_statuses, :task_statuses
  end
end
