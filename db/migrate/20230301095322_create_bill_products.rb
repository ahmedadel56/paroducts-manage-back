class CreateBillProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :bill_products do |t|
      t.float :price
      t.float :discount
      t.integer :quantity
      t.float :total_price

      t.timestamps
    end
  end
end
