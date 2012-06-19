class AddBodyToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :body, :text

  end
end
