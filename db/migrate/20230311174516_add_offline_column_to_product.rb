class AddOfflineColumnToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :offline, :boolean, default: false, null: false 
  end
end
