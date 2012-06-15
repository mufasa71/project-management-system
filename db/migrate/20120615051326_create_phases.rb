class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :title
      t.integer :project_id

      t.timestamps
    end
  end
end
