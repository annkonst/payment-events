class ProductList < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :products, dependent: :destroy
  before_destroy { users.clear }

  def all_price
    products.inject(0) {|sum, product| sum + product.price}
  end

end
