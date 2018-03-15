class AddAddressLatitudeToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :address_latitude, :float
  end
end
