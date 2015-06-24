class RenameTablePurchases < ActiveRecord::Migration
  def change
    rename_table :purchases, :purchases_list_of_purchases
  end
end
