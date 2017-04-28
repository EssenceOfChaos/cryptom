class Identity
  include Mongoid::Document
  belongs_to :user
  field :uid, type: String
  field :provider, type: String

  index({ uid: 1}, {drop_dups: false, background: true})

end