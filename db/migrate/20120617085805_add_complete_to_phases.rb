class AddCompleteToPhases < ActiveRecord::Migration
  def change
    add_column :phases, :complete, :boolean, :default => false
  end
end
