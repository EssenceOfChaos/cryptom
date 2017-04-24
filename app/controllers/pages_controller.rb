class PagesController < ApplicationController
  def index
  end

  def dashboard
    @price = current_price.data.prices.first
  end

  def contact
  end
end
