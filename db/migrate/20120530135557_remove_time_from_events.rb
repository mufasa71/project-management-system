class RemoveTimeFromEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :time
    end
  end
end
