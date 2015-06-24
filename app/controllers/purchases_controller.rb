class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.event_id = params[:event_id]
    @purchase.users << current_user
    @purchase.save!
    redirect_to event_path(params[:event_id])
  end

  def purchase_params
    params.require(:purchase).permit(:price, :amount,:name)
  end

end
