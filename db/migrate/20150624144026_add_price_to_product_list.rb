class AddPriceToProductList < ActiveRecord::Migration
  def change
    add_column :product_lists, :price, :decimal, precision: 5, scale: 2
  end
end
