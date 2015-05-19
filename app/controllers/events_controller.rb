class EventsController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  def index
    @events = current_user.events
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.users << current_user
    @event.save

    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :date)
    end
end
