class AddListOfPurchaseIdToPurchasesListOfPurchases < ActiveRecord::Migration
  def change
    add_column :purchases_list_of_purchases, :purchases_list_of_purchase_id, :integer
  end
end
