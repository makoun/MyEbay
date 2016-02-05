class RemoverateFromProducts < ActiveRecord::Migration
  def change
    remove_column :users, :rate
    remove_column :products, :rate
    remove_column :products, :img
  end
end
