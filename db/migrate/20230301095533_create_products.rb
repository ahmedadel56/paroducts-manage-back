class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :quantity
      t.string :desired_quantity_integer

      t.timestamps
    end
  end
end
