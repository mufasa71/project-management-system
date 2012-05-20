class RemoveAttrFromAttachments < ActiveRecord::Migration
  def change
    remove_column :attachments, :md5
    remove_column :attachments, :file
    remove_column :attachments, :size

  end
end
