class AddAttrToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :md5, :string
    add_column :attachments, :size, :string
    add_column :attachments, :number_of_downloads, :integer
  end
end
