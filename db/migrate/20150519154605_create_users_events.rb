class CreateUsersEvents < ActiveRecord::Migration
  create_join_table :users, :events
end
