PAGES = {
    'My event' => '/events',
}
When(/^я вхожу как авторизованный пользователь$/) do
  step 'существует пользователь'
  step 'я захожу на главную страницу'
  step "я ввожу \"user@mail.ru\" в поле \"user_email\""
  step "я ввожу \"12356789\" в поле \"user_password\""
  step "я нажимаю кнопку \"log_in\""
end

When /^я вхожу на страницу "([^"]*)"$/ do |page_name|
  visit PAGES[page_name]
end

When(/^я изменяю название и дату события$/) do
  step "я ввожу \"Test_edit\" в поле \"event_name\""
  step "я ввожу \"31.10.2015\" в поле \"event_date\""
  step "я нажимаю кнопку \"edit\""
end

When /^я нажимаю ссылку "([^"]*)"$/ do |link_text|
  click_link I18n.t(link_text)
end

When(/^я подтверждаю$/) do
  page.driver.browser.switch_to.alert.accept if page.driver.browser.try(:switch_to)
end

When(/^в базе количество событий равно (\d+)$/) do |arg1|
  expect(Event.count).to eq(arg1.to_i)
end

When /^я жду (\d+) секунд.*$/ do |seconds|
  sleep seconds.to_i
end




