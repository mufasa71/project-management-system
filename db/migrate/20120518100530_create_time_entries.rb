class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :user_id
      t.integer :activity_id
      t.integer :project_id
      t.integer :hours
      t.integer :spent_on
      t.string :comments

      t.timestamps
    end
  end
end
