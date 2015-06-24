class CreateListOfPurchases < ActiveRecord::Migration
  def change
    create_table :list_of_purchases do |t|
      t.string :name

      t.timestamps
    end
  end
end
