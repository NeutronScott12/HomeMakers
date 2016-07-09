class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :email
      t.string :website
      t.string :address

      t.timestamps null: false
    end
  end
end
