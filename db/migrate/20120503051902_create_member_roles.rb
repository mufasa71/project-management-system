class CreateMemberRoles < ActiveRecord::Migration
  def change
    create_table :member_roles do |t|
      t.references :member, :role

      t.timestamps
    end
  end
end
