class DropColumnNameInPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases_list_of_purchases, :name
  end
end
