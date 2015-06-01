class InvitesController < ApplicationController

  def index

  end

  def create
    @invite = Invite.new(params[:event_id])
    @invite.save!
    redirect_to events_path
  end

  def new
    @users = User.all
    @invite = Invite.new
    @event_id = params[:event_id]
    @event = Event.find(params[:event_id])
  end
end
