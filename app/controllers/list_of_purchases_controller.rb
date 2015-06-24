class ListOfPurchasesController < ApplicationController
  def create
    @list = ListOfPurchase.new(list_of_purchases_params)
    @list.event_id = params[:event_id]
    @list.save!
    redirect_to event_path(params[:event_id])
  end

  def new
    @list = ListOfPurchase.new
  end

  def list_of_purchases_params
    params.require(:list_of_purchase).permit(:name)
  end

  def edit
    @user = current_user
    redirect_to event_path(params[:event_id])
  end

end