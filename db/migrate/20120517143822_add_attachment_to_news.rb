class AddAttachmentToNews < ActiveRecord::Migration
  def change
    add_column :news, :attachment, :string

  end
end
