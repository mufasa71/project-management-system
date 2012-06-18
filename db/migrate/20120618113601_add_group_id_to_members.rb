class AddGroupIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :group_id, :integer

  end
end
