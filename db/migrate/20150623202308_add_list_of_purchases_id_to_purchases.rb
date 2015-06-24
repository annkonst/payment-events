class AddListOfPurchasesIdToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :list_of_purchases_id, :integer
  end
end
