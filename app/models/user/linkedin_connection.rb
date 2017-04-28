# app/models/user/linkedin_connection.rb

class User::LinkedinConnection
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :user

  field :token
  field :secret
end