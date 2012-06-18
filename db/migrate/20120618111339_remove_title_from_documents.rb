class RemoveTitleFromDocuments < ActiveRecord::Migration
  def up
    remove_column :documents, :title
      end

  def down
    add_column :documents, :title, :string
  end
end
