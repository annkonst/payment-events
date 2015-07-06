class ChangeStateInEvent < ActiveRecord::Migration
  def change
    change_column :events, :state, :integer, default: 0
  end
end
