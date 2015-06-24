class AddCountToPurchasesListOfPurchases < ActiveRecord::Migration
  def change
    add_column :purchases_list_of_purchases, :count, :integer
  end
end
