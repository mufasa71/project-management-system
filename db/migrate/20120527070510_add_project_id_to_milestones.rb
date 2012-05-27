class AddProjectIdToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :project_id, :integer

  end
end
