class Participant
  attr_accessor :name, :money_required, :money_invested, :debt

  def initialize(name_key, money_required, event)
    @name = User.find(name_key).name
    @money_required = money_required
    @money_invested = event.user_money(name_key)
    @debt = @money_required - @money_invested
  end
end
