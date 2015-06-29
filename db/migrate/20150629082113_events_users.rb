class EventsUsers < ActiveRecord::Migration
  def change
    create_table "events_users", id: false, force: true do |t|
      t.integer "user_id",  null: false
      t.integer "event_id", null: false
    end
  end
end
