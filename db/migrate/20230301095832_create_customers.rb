class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_number
      t.text :address
      t.float :total_debits

      t.timestamps
    end
  end
end
