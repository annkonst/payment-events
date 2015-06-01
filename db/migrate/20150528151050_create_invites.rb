class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user
      t.references :event
      t.integer :state

      t.timestamps
    end
  end
end
