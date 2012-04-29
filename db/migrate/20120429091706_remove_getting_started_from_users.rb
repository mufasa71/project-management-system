class RemoveGettingStartedFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :getting_started
  end

  def down
    add_column :users, :getting_started, :boolean
  end
end
