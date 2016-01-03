class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :auth_token

  has_many :purchases

  def purchases

  	object.purchases.select {|purchase| purchase if Time.at(purchase.expiration_time) > Time.now}  	
  end
end
