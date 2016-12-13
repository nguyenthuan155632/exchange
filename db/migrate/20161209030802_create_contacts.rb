class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references  :user
      t.string      :message

      t.timestamps null: false
    end
  end
end
