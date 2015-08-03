class Product < ActiveRecord::Base
  validates :name, presence: true
  rescue => exception
    ExceptionNotifier.notify_exception(exception)
end