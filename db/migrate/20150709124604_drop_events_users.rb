class DropEventsUsers < ActiveRecord::Migration

  def change
    drop_join_table :events, :users
  end
end
