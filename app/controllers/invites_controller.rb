class InvitesController < ApplicationController

  def index
    @user = current_user
    @event_name = params[:event_id]
    @invite_user = Invite.where(user: current_user)
  end

  def new
    invited = Event.where(id: params[:event_id]).first.invites.pluck(:user_id)
    uninvited = User.where.not(id: current_user).pluck(:id) - invited
    @users = User.where(id: uninvited)
    @invite = Invite.new
    @event_id = params[:event_id]
  end

  def create
    return  redirect_to event_path(invite_params[:event_id]), notice: 'The user has already been invited' if Invite.exists?(invite_params)
    @invite = Invite.new(invite_params)
    @invite.save!
    redirect_to event_path(@invite.event)
  end

  def update
    @invite = Invite.find(params[:id])
    @invite.update(state_params)
    redirect_to invites_path
  end

  def invite_params
    params.require(:invite).permit(:user_id, :event_id)
  end

  def state_params
    params.permit(:state)
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy
    redirect_to event_path(@invite.event)
  end

end
