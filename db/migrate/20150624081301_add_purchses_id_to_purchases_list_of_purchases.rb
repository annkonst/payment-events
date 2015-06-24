class AddPurchsesIdToPurchasesListOfPurchases < ActiveRecord::Migration
  def change
    add_column :purchases_list_of_purchases, :purchase_id, :integer
  end
end
