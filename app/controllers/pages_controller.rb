class PagesController < ApplicationController
before_action :check_address, only: :dashboard

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

private

def check_address
if current_user.wallet == nil
  redirect_to "/", alert: 'You must create a wallet before accessing your dashboard'
end
end


end
