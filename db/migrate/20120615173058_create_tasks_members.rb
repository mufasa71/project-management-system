class CreateTasksMembers < ActiveRecord::Migration
  def change
    create_table :tasks_members do |t|
      t.integer :task_id
      t.integer :member_id
    end
  end
end
