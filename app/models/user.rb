class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :auth_token, uniqueness: true
         validates :email, uniqueness: true

         #before saving the new instance the token in generated for the user
         before_create :generate_auth_token

         has_many :purchases, dependent: :destroy
  
  def generate_auth_token
    begin
		  self.auth_token = Devise.friendly_token
		end while self.class.exists?(auth_token: auth_token) #nella classe User esiste un token == auth_token?
                                                          #se esiste ritorna al begin e ricomincia il loop altrimenti -> return
    end

end
