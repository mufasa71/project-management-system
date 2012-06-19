class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :prepared_by
      t.text :description
      t.text :comments
      t.integer :project_id

      t.timestamps
    end
  end
end
