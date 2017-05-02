class Wallet
  include Mongoid::Document
  include Mongoid::Timestamps
  field :address, type: Hash
  embedded_in :user
end