class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   protect_from_forgery with: :null_session

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_homes_top_path
    when Customer
      root_path
    end
  end



  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :customer
      new_customer_session_path
    end
  end




  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number])
  end
end
