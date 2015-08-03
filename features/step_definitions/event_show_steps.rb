When(/^я создаю событие$/) do
  visit new_event_path
  event_name = Event.last.try(:id).to_i + 1
  step "я ввожу \"Test_#{event_name}\" в поле \"event_name\""
  step "я ввожу \"02.09.2015\" в поле \"event_date\""
  step 'я нажимаю кнопку "create"'
end

When(/^Обращение к sms\.ru застаблено$/) do
  stub_request(:post, App.sms_uri).to_return(body: "100\n000-00000")
end

When(/^существует пользоваетель user2$/) do
  @user2 = User.create!(password: "87654321", email: "user2@mail.ru", name: "user2", phone_number: "89889973689")
end

When(/^я приглашаю пользователя user2$/) do
  step  "я нажимаю ссылку \"invite\""
  page.select("user2", :from => "invite_user_id") 
  step 'я нажимаю кнопку "invite"'
end

When(/^в базе количество "(.*?)" равно (\d+)$/) do |arg1, arg2|
  expect(arg1.constantize.count).to eq(arg2.to_i)
end

When(/^я создаю список продуктов$/) do
  step  "я нажимаю ссылку \"create_list_of_products\""
  step "я ввожу \"main product\" в поле \"product_list_name\""
  step 'я нажимаю кнопку "create"'
end

When(/^я создаю продукт в списке$/) do
  step "я нажимаю ссылку \"add_product\""
  step "я ввожу \"bread\" в поле \"product_name\""
  step 'я нажимаю кнопку "add_product"'
end

When(/^количество продуктов в списке равно (\d+)$/) do |arg1|
  expect(ProductList.first.products.count).to eq(arg1.to_i)
end

When(/^количество пользователей в списке равно (\d+)$/) do |arg1|
  expect(ProductList.first.users.count).to eq(arg1.to_i)
end

When(/^пользователь user2 добавлен в список$/) do
  ProductList.first.users << @user2
end
