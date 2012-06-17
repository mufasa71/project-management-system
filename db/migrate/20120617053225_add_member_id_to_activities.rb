class AddMemberIdToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.integer :member_id
    end
  end
end
