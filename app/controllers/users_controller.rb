class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    err = @user.errors.full_messages.join(', ') unless @user.update_attributes(user_params)
    redirect_to edit_user_path(@user.id), alert: err
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :phone_number)
  end
end
