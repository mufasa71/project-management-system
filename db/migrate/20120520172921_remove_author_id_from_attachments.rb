class RemoveAuthorIdFromAttachments < ActiveRecord::Migration
  def up
    remove_column :attachments, :author_id
      end

  def down
    add_column :attachments, :author_id, :integer
  end
end
