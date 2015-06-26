class AddEventIdToProductListAndRemovePrice < ActiveRecord::Migration
  def change
    add_column :product_lists, :event_id, :integer
    remove_column :product_lists, :price, :integer
  end
end
