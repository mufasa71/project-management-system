class AddActivitiesToReports < ActiveRecord::Migration
  def change
    add_column :reports, :activities, :string

  end
end
