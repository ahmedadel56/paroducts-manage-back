class AddCustomerToBill < ActiveRecord::Migration[7.0]
  def change
    add_reference :bills, :customer, null: true, foreign_key: true
  end
end
