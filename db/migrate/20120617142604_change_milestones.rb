class ChangeMilestones < ActiveRecord::Migration
  def change
    change_table :milestones do |t|
      t.integer :project_id
    end
  end
end
