When(/^существует пользователь$/) do
  user = User.create!(password: "12356789", email: "user@mail.ru", name: "user1", phone_number: "89879973689")
end

When(/^я захожу на главную страницу$/) do
  visit new_user_session_path
end

When(/^я ввожу "(.*?)" в поле "(.*?)"$/) do |value, field|
  fill_in field, with: value
end

When(/^я нажимаю кнопку "(.*?)"$/) do |button|
  click_button I18n.t(button)
end

Then(/^я вижу "(.*?)"$/) do |links|
  links.split(',').each do |link|
    page.assert_text(link.strip)
  end
end