class AddNumberIntakeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :number, :string

    add_column :profiles, :intake, :string

  end
end
