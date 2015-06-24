class CreatePurchasesListOfPurchases < ActiveRecord::Migration
  def change
    create_table :purchases_list_of_purchases do |t|

      t.timestamps
    end
  end
end
