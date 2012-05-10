class AddSubjectToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :subject, :string

  end
end
