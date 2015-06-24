class Purchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
