Пусть(/^существует пользователь$/) do
  user = User.create(password: "123", email: "user@mail.ru")
end