class AddProductAndBillToBillProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :bill_products, :bill, null: false, foreign_key: true
    add_reference :bill_products, :product, null: false, foreign_key: true
  end
end
