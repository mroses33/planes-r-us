class AddAddressToPlanes < ActiveRecord::Migration[6.0]
  def change
    add_column :planes, :address, :string
  end
end
