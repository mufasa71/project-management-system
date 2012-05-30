class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :description
      t.string :location
      t.integer :project_id

      t.timestamps
    end
  end
end
