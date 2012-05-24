class ChangeMembers < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.rename :project_id, :group_id
    end
  end
end
