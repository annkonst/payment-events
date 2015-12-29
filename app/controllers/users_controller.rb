class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
    redirect_to events_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if user_params.present?
      @user.update_attributes(user_params)
    end
    redirect_to edit_user_path(@user.id)
  end

  def delete_avatar
    @user = current_user
    @user.avatar.destroy
    @user.save
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :phone_number)
  end
end