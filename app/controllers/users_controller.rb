class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if user_params.present?
      @user.update_attributes(user_params)
    end
    redirect_to edit_user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :phone_number)
  end
end