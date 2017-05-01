class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!

helper_method :current_price, :current_time

def current_price
  price = BlockIo.get_current_price :price_base => 'USD'
 current_price = JSON.parse(price.to_json, object_class: OpenStruct)
end

def current_time
  current_time = DateTime.now
end

def wallet_info
 wallet = BlockIo.get_address_balance :labels => current_user.email
 wallet_info = JSON.parse(wallet.to_json, object_class: OpenStruct)
end

protected


def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
end

include PagesHelper
end
