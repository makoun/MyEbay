class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :postal_adress, :text
    add_column :users, :rate, :integer
    add_column :users, :admin, :bool
  end
end
