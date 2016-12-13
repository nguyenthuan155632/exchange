class CreateBtcAddresses < ActiveRecord::Migration
  def change
    create_table :btc_addresses do |t|
      t.string :address
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
