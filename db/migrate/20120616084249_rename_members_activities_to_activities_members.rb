class RenameMembersActivitiesToActivitiesMembers < ActiveRecord::Migration
  def change
    rename_table :members_activities, :activities_members
  end
end
