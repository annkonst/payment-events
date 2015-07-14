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

  def new
    @event_id = params[:event_id]
    @list_id = params[:list_id]
    @product = Product.new
  end

  def product_params
    params.require(:product).permit(:name, :product_list_id)
  end
end