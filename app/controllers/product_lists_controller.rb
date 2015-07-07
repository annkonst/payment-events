class ProductListsController < ApplicationController

  def new
    @list = ProductList.new
  end

  def create
    @list = ProductList.new(product_lists_params)
    @list.event_id = params[:event_id]
    @list.save!
    redirect_to event_path(params[:event_id])
  end

  def add_user
    @list = ProductList.find(params[:product_list_id])
    @list.users << current_user
    redirect_to event_path(params[:event_id])
  end

  def exit_list
    @list = ProductList.find(params[:product_list_id])
    @list.users.delete(current_user.id)
    redirect_to event_path(params[:event_id])
  end

  def destroy
    ProductList.find(params[:id]).destroy
    redirect_to event_path(params[:event_id])
  end

  def product_lists_params
    params.require(:product_list).permit(:name)
  end

end
