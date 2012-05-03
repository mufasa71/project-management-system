class AddIsPublicToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.boolean :is_public, :default => true
    end
  end
end
