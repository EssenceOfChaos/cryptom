class WalletsController < ApplicationController
   before_action :check_address, only: :create

  def index
  end

def create
response = BlockIo.get_new_address :label => current_user.email
@symbol   = JSON.parse(response.to_json, symbolize_names: true)
@wallet = current_user.build_wallet(address: @symbol)
@wallet.save

redirect_to "/pages/dashboard", notice: 'Wallet was successfully created.'
end

def show

end


private

def check_address
if current_user.wallet != nil
  redirect_to "/pages/dashboard", alert: 'You may only create one wallet at this time'
end
end

end
  
# The call  <%=current_user.wallet.address%> results in :

# "status"=>"success", "data"=>{"network"=>"BTC", "user_id"=>58, "address"=>"3HFvKJGLR1Lbfd2Pohka4cL6Qcd6LdtQBW", "label"=>"eoc@aol.com"}}