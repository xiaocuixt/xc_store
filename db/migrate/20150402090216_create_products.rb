class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :stock_amount

      t.timestamps null: false
    end
  end
end
