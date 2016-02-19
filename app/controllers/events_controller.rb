class EventsController < ApplicationController
  before_filter :authenticate_user!
  layout 'application'

  def index
    @user = current_user
    @events = current_user.invites.accepted.map(&:event)
  end

  def show
    @user = current_user
    @users = User.all
    @event = Event.find(params[:id])
    @invite = Invite.new
    @lists = @event.product_lists
  end

  def new
    @user = current_user
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @user = current_user
    @event.user = current_user
    return redirect_to new_event_path, alert: t(:inappropriate_date_and_time_of_the_event) unless @event.save
    @event.invites.create(user_id: @user.id, event_id: @event.id, state: Invite::ACCEPT)
    redirect_to event_path(@event.id)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    return redirect_to event_path(@event) if @event.update(event_params)
    render 'edit'
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def calculate
    @event = Event.find(params[:event_id])
    return redirect_to :back, alert: t(:event_search_failed) unless @event
    @users_debts = debts_calculation(@event)
    @users_debts = debts_normalize(@users_debts, @event)
    @money_transactions = debts_transactions(@users_debts)
  end

  def event_report
    @event = Event.find(params[:event_id])
    @lists = @event.product_lists if @event.present?
  end

  private

  def debts_calculation(event)
    debts_hash = {}
    event.product_lists.each do |list|
      list.users.each do |user|
        debts_hash[user.id] = debts_hash[user.id].to_f + list.price / list.users.count
      end
    end
    debts_hash
  end

  def debts_normalize(debts_hash, event)
    debts_hash.map { |user_id, money_required| Hashed.new(user_id, money_required, event) }
  end

  def debts_transactions(users)
    @transactions = []
    while min_debt_user(users).debt < 0
      if min_debt_user(users).debt.abs >= max_debt_user(users).debt
        create_transaction(max_debt_user(users), min_debt_user(users), users, @transactions)
      else
        create_transaction(min_debt_user(users), max_debt_user(users), users, @transactions)
      end
    end
    @transactions
  end

  def create_transaction(a, b, users, transactions)
    transactions << "#{max_debt_user(users).name} #{t(:owes)} #{min_debt_user(users).name} #{a.debt.abs.round}"
    b.debt += a.debt
    a.debt = 0
  end

  def min_debt_user(users)
    users.min_by(&:debt)
  end

  def max_debt_user(users)
    users.max_by(&:debt)
  end

  def event_params
    params.require(:event).permit(:name, :date, :state)
  end
end
