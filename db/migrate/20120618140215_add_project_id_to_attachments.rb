class AddProjectIdToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :project_id, :integer

  end
end
