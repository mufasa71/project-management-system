class RemoveStartDateEndDateFromIssues < ActiveRecord::Migration
  def up
    remove_column :issues, :start_date
    remove_column :issues, :end_date
  end

  def down
    add_column :issues, :end_date, :date
    add_column :issues, :start_date, :date
  end
end
