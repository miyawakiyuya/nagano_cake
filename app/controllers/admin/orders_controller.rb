class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @postage = 800
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      # binding.pry
      @order.order_details.update(making_status:1) if @order.status == "payment_confirmation"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
