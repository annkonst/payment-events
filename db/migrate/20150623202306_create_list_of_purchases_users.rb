class CreateListOfPurchasesUsers < ActiveRecord::Migration
  def change
    create_join_table :list_of_purchases, :users
  end
end
