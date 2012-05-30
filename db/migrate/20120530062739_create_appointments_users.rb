class CreateAppointmentsUsers < ActiveRecord::Migration
  def change
    create_table :users_appointments do |t|
      t.integer :user_id
      t.integer :appointment_id
    end
  end
end
