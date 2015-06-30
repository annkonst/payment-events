class ProductList < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :products, dependent: :destroy
  before_destroy { users.clear }

  def all_price
    sum = 0
    products.each do |p|
      sum += p.price
    end
    sum
  end

end
