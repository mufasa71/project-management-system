class AddIntakeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :intake_id, :integer

  end
end
