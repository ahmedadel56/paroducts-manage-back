class AddOriginalBillIdToBills < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :original_bill_id, :integer
    add_foreign_key :bills, :bills, column: :original_bill_id
  end
end
