class AddGettingStartedToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :getting_started, :boolean, :default => true
  end
end
