class CreateIssueCategories < ActiveRecord::Migration
  def change
    create_table :issue_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
