Rails.application.routes.draw do
  
root 'pages#index'

get 'wallets/create'
get 'wallets/show'

  get 'pages/index'
  get 'pages/dashboard'
  get 'pages/contact'
  get 'pages/bitcoin'
  get 'pages/more_info', as: 'FAQ'

# get '/404', to: 'errors#not_found'
# get '/500', to: 'errors#internal_server_error'

devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end
