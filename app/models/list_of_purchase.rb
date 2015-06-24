class ListOfPurchase < ActiveRecord::Base
  has_many :purchases_list_of_purchase
  has_and_belongs_to_many :users
  has_many :purchases, through: :purchases_list_of_purchase
end
