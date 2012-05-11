class RenameFilenameToFileInAttachments < ActiveRecord::Migration
  def up
    rename_column :attachments, :filename, :file
  end

  def down
    rename_column :attachments, :file, :filename
  end
end
