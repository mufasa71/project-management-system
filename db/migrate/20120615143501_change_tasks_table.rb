class ChangeTasksTable < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.rename :project_id, :activity_id
      t.remove :tracker_id
      t.remove :author_id
      t.remove :assigned_to_id
      t.remove :fixed_version_id
      t.remove :category_id
      t.remove :due_date
      t.remove :estimated_time
      t.remove :done
    end
  end
end
