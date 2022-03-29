class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address, :varchar
  end
end
