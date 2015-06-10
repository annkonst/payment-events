class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user
      t.references :event
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
