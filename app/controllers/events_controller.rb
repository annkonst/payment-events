class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @events = current_user.events
  end

  def show
    @user = current_user
    @users = User.all
    @event = Event.find(params[:id])
    @invite = Invite.new
    @list = @event.list_of_purchases
  end

  def new
    @user = current_user
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save!
    @event.users << current_user
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if event_params.present?
      @event.update(event_params)
    end
      redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def event_params
    params.require(:event).permit(:name, :date)
  end

end
