class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.float  :amout
      t.integer :rate
      t.boolean :btc_jpy
      t.integer :status, default: 0
      t.references  :user
      t.references  :shop
      t.references  :btc_address

      t.timestamps null: false
    end
  end
end
