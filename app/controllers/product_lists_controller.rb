class ProductListsController < ApplicationController

  def new
    @list = ProductList.new
  end

  def create
    @list = ProductList.new(product_lists_params)
    @list.event_id = params[:event_id]
    @list.save ? (redirect_to event_path(params[:event_id])) : (redirect_to :back, alert: t(:enter_name_product_list))
  end

  def update_sum
    @list = ProductList.find(find_id) # BOMB
    @list.update(sum_params)
    redirect_to event_product_lists_path
  end

  def add_user
    @event = Event.find(params[:event_id])
    @list = ProductList.find(params[:product_list_id]) # BOMB
    @list_id = @list.id
    @list.users << current_user unless @list.users.include? current_user
  end

  def exit_list
    @event = Event.find(params[:event_id])
    @list = ProductList.find(params[:product_list_id]) # BOMB
    @list_id = @list.id
    @list.users.delete(current_user.id)
    render action: 'add_user'
  end

  def destroy
    ProductList.find(params[:id]).destroy
    redirect_to event_path(params[:event_id])
  end

  def product_lists_params
    params.require(:product_list).permit(:name)
  end

  private

  def sum_params
    params.permit(:price)
  end

  def find_id
    params[:product_list_id].scan(/list_(\d+)_sum/) * ''
  end

end
