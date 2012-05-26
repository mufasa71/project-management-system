class AddDueDateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :due_date, :date

  end
end
