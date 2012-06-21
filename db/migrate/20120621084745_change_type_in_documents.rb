class ChangeTypeInDocuments < ActiveRecord::Migration
  def change
    change_column :documents, :pad_id, :string
  end
end
