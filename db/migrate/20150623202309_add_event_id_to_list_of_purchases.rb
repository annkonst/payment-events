class AddEventIdToListOfPurchases < ActiveRecord::Migration
  def change
    add_column :list_of_purchases, :event_id, :integer
  end
end
