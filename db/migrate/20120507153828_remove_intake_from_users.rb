class RemoveIntakeFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :intake
  end

  def down
    add_column :users, :intake, :string
  end
end
