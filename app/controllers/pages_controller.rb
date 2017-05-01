class PagesController < ApplicationController
  before_action :check_address, only: [:dashboard]

  def index
  end

  def dashboard
@price = current_price.data.prices.first
@price = current_price.data.prices.first
@balance = wallet_info.data.available_balance
@address = wallet_info.data.balances[0]['address']
  end

  def contact
  end

def check_address
  check = BlockIo.get_address_by :label => current_user.email
  checker = JSON.parse(check.to_json, object_class: OpenStruct)
  unless checker.status == 'success'
    redirect_to "/", alert: "Create a wallet before accessing your dashboard"
  end

end


end
