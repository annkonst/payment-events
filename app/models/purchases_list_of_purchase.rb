class PurchasesListOfPurchase < ActiveRecord::Base
  has_one :purchase
  has_one :list_of_purchase
end
