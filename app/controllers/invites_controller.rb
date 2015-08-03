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
    return  redirect_to event_path(invite_params[:event_id]) if Invite.exists?(invite_params)
    @user_ids = invite_params[:user_id]
    @user_ids.delete('')
    if @user_ids.present?
      @user_ids.each do |user_id|
        @invite = Invite.new(user_id: user_id, event_id: invite_params[:event_id])
        @invite.save!
      end
    end
    redirect_to event_path(invite_params[:event_id])
  end

  def update
    @invite = Invite.find(params[:id])
    @invite.update(state_params)
    redirect_to invites_path
  end

  def update_amount
    @invite = Invite.find(find_id)
    @invite.update(amount_params)
    redirect_to invites_path
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy
    redirect_to event_path(@invite.event)
  end

  private

  def invite_params
    params.require(:invite).permit(:event_id, :user_id =>[])
  end

  def state_params
    params.permit(:state)
  end

  def amount_params
    params.permit(:user_money)
  end

  def find_id
    params[:invite_id].scan(/users_(\d+)_money/)*''
  end

end
