class DropAppointmentsMembers < ActiveRecord::Migration
  def change
    drop_table :members_appointments
  end
end
