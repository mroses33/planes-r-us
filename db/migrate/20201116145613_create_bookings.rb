class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :price
      t.references :customer, null: false
      t.references :plane, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :bookings, :users, column: :customer_id, primary_key: :id

  end
end
