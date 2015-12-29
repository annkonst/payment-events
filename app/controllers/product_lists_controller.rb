class ProductListsController < ApplicationController

  def new
    @list = ProductList.new
  end

  def create
    @list = ProductList.new(product_lists_params)
    @list.event_id = params[:event_id]
    @list.save ? (redirect_to event_path(params[:event_id])) : (redirect_to :back, alert: t(:enter_name_product_list))
  end

  def add_user
    @list = ProductList.find(params[:product_list_id])
    @list.users << current_user
    redirect_to event_path(params[:event_id])
  end

  def exit_list
    if @list = ProductList.find(params[:product_list_id])
      @list.users.delete(current_user.id)
    end
    redirect_to event_path(params[:event_id])
  end

  def destroy
    ProductList.find(params[:id]).destroy
    redirect_to event_path(params[:event_id])
  end

  private

  def product_lists_params
    params.require(:product_list).permit(:name)
  end

end
