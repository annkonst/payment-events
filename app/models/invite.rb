class Invite < ActiveRecord::Base
  create_join_table :users, :events

end
