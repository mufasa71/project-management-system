class CreateIntakes < ActiveRecord::Migration
  def change
    create_table :intakes do |t|
      t.string :number

      t.timestamps
    end
  end
end
