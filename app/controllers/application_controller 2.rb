class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  # prepend_before_filter :require_no_authentication, :only => [ :cancel]

  def after_sign_up_path_for(resource)
    redirect_to admins_sites_top_path
  end


  def after_sign_in_path_for(resource)
    case resource
      when Client
        clients_items_top_path
      when Customer
      customers_customer_index_path(genre_sort: 0)
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :client
      new_client_session_path
    else
      admins_sites_top_path
    end
  end

  # def price_include_tax(price)
  #   price = price * 1.1
  #   price.floor
  # end


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:shop_name, :shop_name_kana,:first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :postal_code, :address])
  end

end
