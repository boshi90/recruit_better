class AddAddressLongitudeToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :address_longitude, :float
  end
end
