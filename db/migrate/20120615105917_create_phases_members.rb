class CreatePhasesMembers < ActiveRecord::Migration
  def change
    create_table :phases_members do |t|
      t.integer :phase_id
      t.integer :member_id
    end
  end
end
