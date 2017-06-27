# Ekam

Простейший клиент для API сервиса ЕКАМ: 
* https://www.ekam.ru/page/online-api
* https://app.ekam.ru/online/swagger

## Совместимость

Клиент работает с версией ЕКАМ API v0.0.1

## Установка

Добавьте следующую строку в Gemfile вашего приложения:

```
gem 'ecwid_api'
```

Затем выполните команду:

```
$ bundle
```

Или установите gem самостоятельно:

```
$ gem install ecwid_api
```

## Примеры использования

### Инициализация:

```ruby
require 'ekam-ruby'

client = Ekam::Client.new(token)
```

Где `token` - авторизационный токен для вашего приложения ЕКАМ (подробнее тут: https://www.ekam.ru/page/online-api#creation).

### Получение списка чеков

```ruby
# Получить все чеки без ограничений
client.get_receipt_requests

# Получить последние 10 чеков
client.get_receipt_requests({limit: 10})

# Получить только возвраты
client.get_receipt_requests({type: 'returns'})

# Получить все продажи в статусе "error"
client.get_receipt_requests({type: 'sales', status: 'error'})

# Получить чек по заказу с указанным ID
order_id = '12345'
client.get_receipt_requests({order_id: order_id})
```

### Регистрация чека (продажа)

Описание параметров: https://www.ekam.ru/page/online-api#reg

```ruby
receipt_params = {
  "order_id" => "91421af3",
  "order_number" => "1014",
  "type" => "sale",
  "email" => "john@example.net",
  "phone_number" => "79650000000",
  "should_print" => true,
  "cash_amount" => 201.1,
  "electron_amount" => 0,
  "lines" => [
    {
      "price" => 10,
      "quantity" => 2,
      "title"=> "Плюшевый мишка",
      "total_price" => 20,
      "vat_rate" => null
    }
  ]
}

client.create_receipt_request!(receipt_params)
```

### Регистрация чека (возврат)

```ruby
receipt_params = {
  "order_id" => "91421af3",
  "order_number" => "1014",
  "type" => "return",
  "email" => "john@example.net",
  "phone_number" => "79650000000",
  "should_print" => true,
  "cash_amount" => 201.1,
  "electron_amount" => 0,
  "lines" => [
    {
      "price" => 10,
      "quantity" => 2,
      "title"=> "Плюшевый мишка",
      "total_price" => 20,
      "vat_rate" => null
    }
  ]
}

client.create_receipt_request!(receipt_params)
```

### Закрытие смены

```ruby
client.close_shift!
```
