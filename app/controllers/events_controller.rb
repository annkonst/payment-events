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
    Invite.create(user_id: @user.id, event_id: @event.id, state: 1)
    redirect_to event_path(@event.id)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params) if event_params.present?
    redirect_to event_path(id: @event.id)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def calculate
    @event = Event.find(params[:event_id]) # BOMB
    debts_calculation
    debts_normalize
    debts_transactions
  end

  def debts_calculation
    @users_hash = {}
    @event.product_lists.each do |list|
      list.users.each do |user|
        @users_hash[user.id] = @users_hash[user.id].to_f + list.price / list.users.count
      end
    end
  end

  def debts_normalize
    @members = []
    @users_hash.each do |hsh|
      @members << Hashed.new(hsh[0], hsh[1], @event)
    end
  end

  def debts_transactions
    @connects = []
    while min_debt.debt < 0
      min_debt.debt.abs >= max_debt.debt ? create_connection(max_debt, min_debt) : create_connection(min_debt, max_debt)
    end
  end

  def create_connection(a, b)
    @connects << "#{max_debt.name} #{t(:owes)} #{min_debt.name} #{a.debt.abs.round}"
    b.debt += a.debt
    a.debt = 0
  end

  def min_debt
    @members.min_by(&:debt)
  end

  def max_debt
    @members.max_by(&:debt)
  end

  def event_report
    @event = Event.find(params[:event_id])
    @lists = @event.product_lists if @event.present?
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :state)
  end
end
