class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :description
      t.integer :issue_id

      t.timestamps
    end
  end
end
