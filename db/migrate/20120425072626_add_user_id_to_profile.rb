class AddUserIdToProfile < ActiveRecord::Migration
  def change
    change_table :profiles do |t|
      t.references :user
    end
  end
end
