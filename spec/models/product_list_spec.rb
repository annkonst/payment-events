require 'rails_helper'

RSpec.describe ProductList, :type => :model do
  it "all price product list" do
    product_list = ProductList.create(name: 'list1', price: 0)
    product1 = Product.create(name: 'product1', price: 20, product_list_id: product_list.id)
    product2 = Product.create(name: 'product2', price: 10, product_list_id: product_list.id)
    expect(product_list.all_price).to eq(30)
  end

  it "creating product list" do
    expect{ ProductList.create(name: 'list1') }.to change{ProductList.count}.from(0).to(1)
  end

  it "product list without users return false" do
    user1 = User.create(name: 'u1', phone_number: '1234567891', email: 'user1@mail.ru', password: '12345678')
    p_l = ProductList.create(name: 'list1')
    p_l.users << user1
    expect(p_l.without_users?).to eq(false)
  end

  it "product list without users return true" do
    p_l = ProductList.create(name: 'list1')
    product = Product.create(name: 'product1', price: 20, product_list_id: p_l.id)
    expect(p_l.without_users?).to eq(true)
  end

end
