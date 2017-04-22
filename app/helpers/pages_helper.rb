require 'httparty'
module PagesHelper
url = 'https://api.gemini.com/v1/pubticker/btcusd'
response = HTTParty.get(url)
@btc_price = response
end
