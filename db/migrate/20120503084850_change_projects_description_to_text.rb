class ChangeProjectsDescriptionToText < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.remove :description
      t.text :description
    end
  end
end
