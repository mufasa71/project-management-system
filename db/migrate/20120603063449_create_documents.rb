class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.integer :pad_id
      t.integer :project

      t.timestamps
    end
  end
end
