require 'rails_helper'

RSpec.describe Invite, :type => :model do
  it "Invite count" do
    expect(Invite.all.count).to eq(0)
    event = Event.create(name: 'day_test', date: '12.12.2015')
    user = User.create!(name: 'Test', email: 'test@test.ru', password: '12345678', phone_number: '1234567897')
    Invite.create(state: 0, user: user, event_id: 1, event: event)
    expect(Invite.all.count).to eq(1)
  end

  it "sending request to send sms" do
    stub_request(:post, App.sms_uri).with(body: {api_id: App.sms_token, to: '9876543211', text: 'text', test: 1}).to_return(:body => "100\n000-00000")
    
  end

end
