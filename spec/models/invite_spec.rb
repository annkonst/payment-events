require 'rails_helper'

RSpec.describe Invite, :type => :model do

  it "Invite count" do
    stub_request(:post, App.sms_uri).to_return(body: "100\n000-00000")
    event = Event.create(name: 'day_test', date: '12.12.2015')
    user = User.create!(name: 'Test', email: 'test@test.ru', password: '12345678', phone_number: '1234567897')
    Invite.create(user_id: user.id, event_id: event.id)
    expect(Invite.all.count).to eq(1)
  end

  it "send sms with answer 100" do
    stub_request(:post, App.sms_uri).to_return( body: "100\n000-00000")
    event = Event.create(name: 'day_test', date: '12.12.2015')
    user = User.create!(name: 'Test', email: 'test@test.ru', password: '12345678', phone_number: '1234567897')
    invite = Invite.create(user_id: user.id, event_id: event.id)
    expect(invite.send_sms).to eq("100")
  end

  it "send sms with answer != 100" do
    stub_request(:post, App.sms_uri).to_return( body: "200\n000-00000")
    event = Event.create(name: 'day_test', date: '12.12.2015')
    user = User.create!(name: 'Test', email: 'test@test.ru', password: '12345678', phone_number: '1234567897')
    invite = Invite.create(user_id: user.id, event_id: event.id)
    expect(invite.send_sms).to eq("Error! Answer:200")
  end

end