class CreateIntakesSubjects < ActiveRecord::Migration
  def change
    create_table :intakes_subjects do |t|
      t.integer :intake_id
      t.integer :subject_id
    end
  end
end
