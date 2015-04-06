class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true
      t.references :order, index: true
      t.string :name
      t.string :phone
      t.string :province
      t.string :city
      t.string :area
      t.string :detail

      t.timestamps null: false
    end
    add_foreign_key :addresses, :users
    add_foreign_key :addresses, :orders
  end
end
