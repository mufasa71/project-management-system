class RemoveGroupIdFromMembers < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.remove :group_id
    end
  end
end
