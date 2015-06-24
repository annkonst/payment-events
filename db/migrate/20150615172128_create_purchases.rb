class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :event_id
      t.string :name
      t.integer :price
      t.integer :amount

      t.timestamps
    end
  end
end
