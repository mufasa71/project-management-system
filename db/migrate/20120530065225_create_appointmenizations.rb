class CreateAppointmenizations < ActiveRecord::Migration
  def change
    create_table :appointmenizations do |t|
      t.integer :appointment_id
      t.integer :member_id

      t.timestamps
    end
  end
end
