class AddGroupIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :group_id, :integer

  end
end
