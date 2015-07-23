When(/^я выхожу со своей страницы$/) do
  click_link I18n.t(:exit)
end

When(/^я авторизируюсь под пользователем user2$/) do
  step "я ввожу \"user2@mail.ru\" в поле \"user_email\""
  step "я ввожу \"87654321\" в поле \"user_password\""
  step "я нажимаю кнопку \"log_in\""
end

When(/^количество моих событий (\d+)$/) do |arg|
  user = User.last
  @events = user.events + user.invites.where(state: 1).map{|x| x.event}
  expect(@events.count).to eq(arg.to_i)
end