class WalletsController < ApplicationController

  def index
  end

def create
response = BlockIo.get_new_address :label => current_user.email
symbol   = JSON.parse(response.to_json, symbolize_names: true)
@symbol = symbol
redirect_back fallback_location: "/", notice: 'Wallet was successfully created.'
end

def show

end

end


  

# {"status"=>"success", "data"=>{"network"=>"BTC", "user_id"=>46, "address"=>"32ckd9JwfFE36ZNhNZT4ikTscfEzRuTduU", "label"=>"mkamwalker.2@gmail.com"}}