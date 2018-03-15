class AddAddressFormattedAddressToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :address_formatted_address, :string
  end
end
