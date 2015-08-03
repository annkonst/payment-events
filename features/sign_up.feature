# language: ru
Функционал: тестирование регистрации

Предыстория:
  Пусть я захожу на главную страницу

@javascript
Сценарий: авторизация
  И я нажимаю ссылку "sign_up"
  И я ввожу "user3" в поле "user_name"
  И я ввожу "89879976956" в поле "user[phone_number]"
  И я ввожу "user@mail.ru" в поле "user_email"
  И я ввожу "12356789" в поле "user_password"
  И я ввожу "12356789" в поле "user_password_confirmation"
  И я нажимаю кнопку "sign_up"
  То я вижу "Welcome! You have signed up successfully. Hello, user3"
  И я жду 4 секунды