# language: ru
Функционал: тестирование страницы "Мои события"

Предыстория:
  Пусть я вхожу как авторизованный пользователь

@javascript
Сценарий: мои события
  Пусть я вхожу на страницу "My event"
  Тогда я вижу "List of Events Name: Date: Your actions Add event"
  И я нажимаю ссылку "add_event"
  И я создаю событие
  То я вижу "Test, 02.09.2015, Edit, Delete, Show"
  И я нажимаю ссылку "edit"
  И я изменяю название и дату события
  И я вижу "Test_edit, 31.10.2015, Edit, Delete, Show"
  И я нажимаю ссылку "delete"
  И я подтверждаю
  И я жду 1 секунду
  И в базе количество событий равно 0