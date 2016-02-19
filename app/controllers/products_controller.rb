class ProductsController < ApplicationController
  def create
    begin
      @event = Event.find(params[:event_id])
      @list_id = product_params["product_list_id"]
      @product_list = ProductList.find(@list_id)
      @product = Product.create(product_params)
    rescue ActiveRecord::RecordNotFound
      redirect_to :back, alert: t(:event_or_product_list_required)
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    @product_id = params[:id]
  end

  def new
    @event_id = params[:event_id]
    @list_id = params[:list_id]
    @product = Product.new
  end

  private

  def product_params
    params.require(:product).permit(:name, :product_list_id)
  end
end
