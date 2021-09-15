class Admin::OrderDetailsController < ApplicationController

  def update
    # order = Order.find(params[:id])
    # order.order_details.update(order_detail_params)
    order_detail = OrderDetail.find(params[:id])
    if order_detail.update(order_detail_params)

      order_detail.order.update(status:2) if order_detail.making_status == "production"
      order_detail.order.update(status:4) if order_detail.order.order_details.count == order_detail.order.order_details.where(making_status:"produced").count
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
