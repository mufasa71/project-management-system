class AddProjectIdToNews < ActiveRecord::Migration
  def change
    add_column :news, :project_id, :integer

  end
end
