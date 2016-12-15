class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string  :name
      t.string  :address
      t.string  :phone
      t.float   :deposit
      t.string  :lat
      t.string  :long
      t.references :operator

      t.timestamps null: false
    end
  end
end
