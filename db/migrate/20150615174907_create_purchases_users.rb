class CreatePurchasesUsers < ActiveRecord::Migration
  def change
    create_join_table :purchases, :users
  end
end
