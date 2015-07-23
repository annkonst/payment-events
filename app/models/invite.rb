class Invite < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  after_create :send_sms

  DONTANSWERED = 0
  ACCEPT = 1
  REJECT = 2

  require 'net/http'
  
  def send_sms
    phone_number = user.phone_number
    text = "#{I18n.t(:hello)} #{user.name} #{event.name} #{event.date.strftime('%d.%m.%Y')}"
    res = Net::HTTP.post_form(URI(App.sms_uri), {
      api_id: App.sms_token,
      to: phone_number,
      text: text,
      test: 1
    })
    puts res.body
    if res.body.split("\n").first != '100'
      logger.error "Error! Answer:#{res.body}"
      "Error! Answer:#{res.body}"
    end
  end

end