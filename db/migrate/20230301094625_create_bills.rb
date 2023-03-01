class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.float :total_before_discount
      t.float :total_dicount_percentage
      t.float :total_discount_value
      t.float :total_after_discount
      t.float :paied
      t.date :date
      t.float :left
      t.float :debit
      t.float :total_debit

      t.timestamps
    end
  end
end
