class AddGettingStartedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :getting_started, :boolean, :default => true

  end
end
