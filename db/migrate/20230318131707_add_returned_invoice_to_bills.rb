class AddReturnedInvoiceToBills < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :returned_invoice, :boolean
  end
end
