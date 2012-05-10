class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :project, :tracker, :status, :author, :assigned_to, :fixed_version, :priority, :category

      t.timestamps
    end
  end
end
