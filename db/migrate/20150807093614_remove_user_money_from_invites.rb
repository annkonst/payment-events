class RemoveUserMoneyFromInvites < ActiveRecord::Migration
  def change
    remove_column :invites, :user_money
  end
end
