class AddPostcodeToPlanes < ActiveRecord::Migration[6.0]
  def change
    add_column :planes, :postcode, :string
  end
end
