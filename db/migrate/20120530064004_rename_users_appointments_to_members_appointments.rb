class RenameUsersAppointmentsToMembersAppointments < ActiveRecord::Migration
  def up
    rename_table :users_appointments, :members_appointments
  end

  def down
    rename_table :members_appointments, :users_appointments
  end
end
