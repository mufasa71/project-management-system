class RenameProjectToProjectIdInDocuments < ActiveRecord::Migration
  def up
    rename_column :documents, :project, :project_id
  end

  def down
    rename_column :documents, :project, :project_id
  end
end
