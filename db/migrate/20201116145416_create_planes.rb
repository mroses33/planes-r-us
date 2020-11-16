class CreatePlanes < ActiveRecord::Migration[6.0]
  def change
    create_table :planes do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :owner, null: false
      t.timestamps
    end
    add_foreign_key :planes, :users, column: :owner_id, primary_key: :id
  end
end
