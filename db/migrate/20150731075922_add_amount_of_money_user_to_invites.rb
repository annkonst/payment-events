class AddAmountOfMoneyUserToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :user_money, :decimal, precision: 6, scale: 2, default: 0
  end
end
