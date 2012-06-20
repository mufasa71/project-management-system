class AddPositionToPhases < ActiveRecord::Migration
  def change
    add_column :phases, :position, :integer, :default => 0
  end
end
