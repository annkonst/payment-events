class ProductList < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :products, dependent: :destroy
  validates :name, presence: true
  before_destroy { users.clear }
end
