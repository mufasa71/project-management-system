class DropUserRoles < ActiveRecord::Migration
  def up
    drop_table :roles_users
  end

  def down
  end
end
