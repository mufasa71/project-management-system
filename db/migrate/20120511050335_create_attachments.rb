class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :description
      t.string :filename
      t.references :attachable, :author

      t.timestamps
    end
    add_index :attachments, :attachable_id
  end
end
