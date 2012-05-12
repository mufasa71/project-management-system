class AddReferencesToIssueCategories < ActiveRecord::Migration
  def change
    add_column :issue_categories, :project_id, :integer

    add_column :issue_categories, :assigned_to_id, :integer

  end
end
