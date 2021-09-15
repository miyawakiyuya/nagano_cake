class CustomersController < ApplicationController
  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  end

  def update
   @customer = current_customer
   @customer.update(customer_params)
   redirect_to customers_my_page_path
  end

  def quit
  end
  def out
   @customer = current_customer
   @customer.update(is_valid: false)
   reset_session
   redirect_to root_path
  end

end

private


def customer_params
    params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number, :email,)
end



