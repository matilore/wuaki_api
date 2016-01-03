module V1
	class SessionsController < ApiController

		before_action :authenticate_with_token!, only: [:destroy]

		def create
		credentials = JSON.parse(params[:data_value])
		user_email = credentials['email']
	    user_password = credentials['password']

	    user = user_email.present? && User.find_by(email: user_email)

	    if user.valid_password? user_password
	      sign_in user, store: false
	      user.generate_auth_token
	      user.save
	      render json: user, status: 200, location: [:v1, user]
	    else
	      render json: { errors: "Invalid email or password" }, status: 422
	    end
	end

	  def destroy
	  	user = User.find_by(auth_token: params[:id])
	    
	  	#Token is updated for a new one
	    user.generate_auth_token
	    user.save
	    head 204
	  end
	end
end