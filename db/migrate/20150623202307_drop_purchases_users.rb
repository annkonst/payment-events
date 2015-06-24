class DropPurchasesUsers < ActiveRecord::Migration
  def change
    drop_table :purchases_users
  end
end
