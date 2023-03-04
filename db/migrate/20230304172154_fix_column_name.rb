class FixColumnName < ActiveRecord::Migration[7.0]
  def up
    rename_column :products, :desired_quantity_integer, :desired_quantity
    change_column :products, :desired_quantity, :integer, using: 'desired_quantity::integer'

  end

  def down
    rename_column :products, :desired_quantity, :desired_quantity_integer
    change_column :products, :desired_quantity_integer, :string
  end
end
