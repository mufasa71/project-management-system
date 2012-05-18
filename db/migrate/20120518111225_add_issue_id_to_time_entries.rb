class AddIssueIdToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :issue_id, :integer

  end
end
