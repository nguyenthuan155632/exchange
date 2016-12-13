class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.float  :amout
      t.integer :rate
      t.boolean :type
      t.integer :status, default: 0
      t.references  :user
      t.references  :shop

      t.timestamps null: false
    end
  end
end
