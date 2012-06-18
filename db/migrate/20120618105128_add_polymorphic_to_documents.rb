class AddPolymorphicToDocuments < ActiveRecord::Migration
  def change
    change_table :documents do |t|
      t.integer :documentable_id
      t.string :documentable_type
    end
  end
end
