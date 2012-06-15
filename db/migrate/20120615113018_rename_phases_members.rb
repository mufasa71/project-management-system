class RenamePhasesMembers < ActiveRecord::Migration
  def change
    rename_table :phases_members, :members_phases
  end
end
