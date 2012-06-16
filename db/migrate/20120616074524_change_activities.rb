class ChangeActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.integer :status_id
      t.integer :priority_id
      t.string :file
    end
  end
end
