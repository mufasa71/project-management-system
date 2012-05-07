class AddNameNumberIntakeSkypeMsnTwitterFacebookToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string

    add_column :users, :number, :string

    add_column :users, :intake, :string

    add_column :users, :skype, :string

    add_column :users, :msn, :string

    add_column :users, :twitter, :string

    add_column :users, :facebook, :string

  end
end
