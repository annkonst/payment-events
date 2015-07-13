class AddStateToProductLists < ActiveRecord::Migration
  def change
    add_column :product_lists, :state, :integer, default: 0
  end
end
