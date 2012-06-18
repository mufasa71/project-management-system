class AddIntakeIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :intake_id, :integer
    add_column :projects, :subject_id, :integer
    add_column :projects, :supervisor_id, :integer
  end
end
