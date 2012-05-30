class RemoveDescriptionFromAppointments < ActiveRecord::Migration
  def change
    change_table :appointments do |t|
      t.remove :description
    end
  end
end
