class CreateIssuePriorities < ActiveRecord::Migration
  def change
    create_table :issue_priorities do |t|
      t.string :name

      t.timestamps
    end
  end
end
