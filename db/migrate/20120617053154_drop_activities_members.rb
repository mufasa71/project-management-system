class DropActivitiesMembers < ActiveRecord::Migration
  def change
    drop_table :activities_members
  end
end
