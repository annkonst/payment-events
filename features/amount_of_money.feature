# language: ru
Функционал: тестирование внесенной суммы

Предыстория:
  Пусть я вхожу как авторизованный пользователь
  И Обращение к sms.ru застаблено
  И я создаю событие
@javascript
Сценарий: расчитывается сумма,которую должен получить пользователь
  И я создаю список продуктов
  И я нажимаю ссылку "add_yourself"
  И я создаю продукт в списке
  И я ввожу "100" в поле "products[1][price]"
  И я нажимаю кнопку "calculate"
  И я вижу "You must give: 100.0"
  И я нажимаю ссылку "back"
  И я ввожу "500" в поле "users_1_money"
  И я нажимаю кнопку "calculate"
  И я вижу "You must get: 400.0"