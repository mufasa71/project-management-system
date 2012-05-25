class AddProjectIdToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :project_id, :integer

  end
end
