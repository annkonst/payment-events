class Hashed
  attr_accessor :name, :spent, :invested, :debt

  def initialize(name_key, money_required, event)
    @name = User.find(name_key).name
    @spent = money_required
    @invested = event.invites.where(user_id: name_key).first.user_money
    @debt = @spent - @invested
  end
end
