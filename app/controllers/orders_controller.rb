class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart_items = current_customer.cart_items
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    order_detail = OrderDetail.new(item_id: cart_item.item_id,order_id: @order.id,price: cart_item.item.with_tax_price,amount: cart_item.amount,making_status: 0)
    order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new
    if params[:order][:payment_method] == "0"
      @order.payment_method = 0
    else
      @order.payment_method = 1
    end
    if params[:order][:address_option]  == "0"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.residence
       @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    else
      @order.postal_code =  params[:order][:postal_code]
      @order.address =  params[:order][:address]
      @order.name =  params[:order][:name]
    end
    @postage = 800
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @postage = 800
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :total_payment, :payment_method, :status)
  end

end

