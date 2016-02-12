class ProductList < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :products, dependent: :destroy
  validates :name, presence: true
  before_destroy { users.clear }

  def all_price
    products.inject(0) {|sum, product| product.price.present? && product.price > 0 ? sum + product.price : sum }
  end

  def without_users?
    users.count == 0 && all_price != 0
  end

end
