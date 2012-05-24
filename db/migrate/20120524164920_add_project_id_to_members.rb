class AddProjectIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :project_id, :integer

  end
end
