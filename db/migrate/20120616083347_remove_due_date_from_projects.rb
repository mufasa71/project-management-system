class RemoveDueDateFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :due_date
  end
end
