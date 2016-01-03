module V1
class ApiController < ApplicationController

	include ActionController::RequestForgeryProtection
	protect_from_forgery with: :null_session

	#current_user is available in the whole app
	include Authenticable
	include ActionController::Serialization
	
	before_action :configure_permitted_parameters, if: :devise_controller?

	
end
end
