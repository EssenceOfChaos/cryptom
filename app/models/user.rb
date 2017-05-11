class User
  include Mongoid::Document
  include Mongoid::Timestamps

    ##  Callbacks  ##
    after_create :first_identity

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:twitter, :facebook, :github, :linkedin]



  ## Associations ##
  embeds_one :user_linkedin_connection, :class_name => 'User::LinkedinConnection'
  has_many :identities, :dependent => :destroy
  embeds_one :wallet


  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :username
  field :uid, type: String
  field :provider, type: String
  field :image, type: String

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  field :locked_at,       type: Time

  def self.from_omniauth(auth)
  where(auth.slice(:uid, :provider)).first_or_create do |user|
    user.uid = auth.uid
    user.provider = auth.provider
    user.username = auth.info.name
    user.email = auth.info.email
    user.image = auth.info.image
  end
end



def first_identity
  self.identities.first_or_create!(:uid => self.uid, :provider => self.provider, :user_id => self.id)
  Identity.where(:user_id => nil).destroy_all
end

def connect_to_linkedin(auth)
  self.provider = auth.provider
  self.uid = auth.uid
  self.user_linkedin_connection = User::LinkedinConnection.new(:token => auth["extra"]["access_token"].token, :secret => auth["extra"]["access_token"].secret)
  unless self.save
    return false
  end
  true
end

def disconnect_from_linkedin!
  self.provider = nil
  self.uid = nil
  self.user_linkedin_connection = nil
  self.save!
end


end
