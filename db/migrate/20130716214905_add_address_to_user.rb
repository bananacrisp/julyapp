class AddAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :town, :string
    add_column :users, :postcode, :string
  end
end
