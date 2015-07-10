class ProductsController < ApplicationController

  def create
    @product = Product.create(product_params)
    redirect_to event_path(params[:event_id])
  end

  def destroy
    Product.find(params[:product_id]).destroy()
    redirect_to event_path(params[:event_id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :product_list_id)
  end

end
