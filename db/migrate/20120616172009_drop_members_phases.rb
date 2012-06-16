class DropMembersPhases < ActiveRecord::Migration
  def up
    drop_table :members_phases
  end

  def down
  end
end
