class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :user, :project

      t.timestamps
    end
  end
end
