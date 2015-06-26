class CreateJoinTableProductListUser < ActiveRecord::Migration
  def change
    create_join_table :product_lists, :users
  end
end
