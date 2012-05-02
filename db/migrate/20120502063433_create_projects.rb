class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :identifier
      t.string :homepage

      t.timestamps
    end
  end
end
