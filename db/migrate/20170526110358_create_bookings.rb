class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.decimal :price
      t.decimal :total

      t.timestamps
    end
  end
end
