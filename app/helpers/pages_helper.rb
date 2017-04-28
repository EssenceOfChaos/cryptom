require 'httparty'
module PagesHelper
url = "https://blockchain.info/q/24hrprice"
response = HTTParty.get(url)
@btc_price = response.parsed_response
end


