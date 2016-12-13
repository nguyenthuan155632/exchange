class CreateKycPapers < ActiveRecord::Migration
  def change
    create_table :kyc_papers do |t|
      t.string  :passport_your_self
      t.string  :passport
      t.string  :address_front
      t.string  :address_after
      t.string  :driver_your_self
      t.string  :driver_front
      t.string  :driver_after
      t.string  :utility_bill
      t.integer :status, default: 0

      t.references :user

      t.timestamps null: false
    end
  end
end
