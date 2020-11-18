class AddAddressNumberToPlanes < ActiveRecord::Migration[6.0]
  def change
    add_column :planes, :address_number, :string
  end
end
