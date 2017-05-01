class PagesController < ApplicationController
  

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



end
