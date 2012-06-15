class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.integer :phase_id
      t.text :description

      t.timestamps
    end
  end
end
