class CreateOrderLineItems < ActiveRecord::Migration
  def change
    create_table :order_line_items do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.string :name
      t.integer :quantity
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :order_line_items, :orders
    add_foreign_key :order_line_items, :products
  end
end
