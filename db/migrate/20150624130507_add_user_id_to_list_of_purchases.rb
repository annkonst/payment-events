class AddUserIdToListOfPurchases < ActiveRecord::Migration
  def change
    add_column :list_of_purchases, :user_id, :integer
  end
end
