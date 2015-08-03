# language: ru
Функционал: тестирование авторизации

Предыстория:
  Пусть существует пользователь

  @javascript
  Сценарий: авторизация
  Допустим я захожу на главную страницу
    И я ввожу "user@mail.ru" в поле "user_email"
    И я ввожу "12356789" в поле "user_password"
    И я нажимаю кнопку "log_in"
    То я вижу "My event, Create event, Invites, Change profile"