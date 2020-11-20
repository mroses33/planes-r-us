class AddDetailsToPlanes < ActiveRecord::Migration[6.0]
  def change
    add_column :planes, :seats, :integer
    add_column :planes, :range, :integer
    add_column :planes, :speed, :integer
  end
end
