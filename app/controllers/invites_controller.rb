class InvitesController < ApplicationController

  def index

  end

  def create
    return  redirect_to event_path(invite_params[:event_id]), notice: 'The user has already been invited' if Invite.exists?(invite_params)
    @invite = Invite.new(invite_params)
    @invite.save!
    redirect_to event_path(@invite.event)
  end

  def new
    @users = User.all
    @invite = Invite.new
    @event_id = params[:event_id]
  end

  def invite_params
    params.require(:invite).permit(:user_id, :event_id)
  end
end
