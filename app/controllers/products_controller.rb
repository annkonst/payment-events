class ProductsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @list_id = product_params["product_list_id"]
    @product = Product.create(product_params)
    @product.save!
  end

  def destroy
    Product.find(params[:id]).destroy()
    @product_id = params[:id]
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    head :ok
  end

  def change_product_list
    @product = Product.find(update_params[:product_id])
    @old_list_id = @product.product_list_id
    @product.update_attribute(:product_list_id, new_product_list_id)
    @old_list = ProductList.find(@old_list_id)
    @new_list = ProductList.find(new_product_list_id)
    @event = @old_list.event
  end

  def new
    @event_id = params[:event_id]
    @list_id = params[:list_id]
    @product = Product.new
  end

  private

  def product_params
    params.require(:product).permit(:name, :product_list_id, :price)
  end
  
  def update_params
    params.permit(:product_id,:product_list_id)
  end

  def new_product_list_id
    update_params[:product_list_id].scan(/list_(\d+)/)*''
  end

end