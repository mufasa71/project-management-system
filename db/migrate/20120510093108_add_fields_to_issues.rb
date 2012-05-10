class AddFieldsToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :start_date, :date

    add_column :issues, :due_date, :date

    add_column :issues, :estimated_time, :integer

    add_column :issues, :done, :integer

    add_column :issues, :file, :string

  end
end
