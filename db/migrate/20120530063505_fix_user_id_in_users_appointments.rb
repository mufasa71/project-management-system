class FixUserIdInUsersAppointments < ActiveRecord::Migration
  def change
    change_table :users_appointments do |t|
      t.rename :user_id, :member_id
    end
  end
end
