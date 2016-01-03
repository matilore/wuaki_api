module V1
	class RegistrationsController < ApiController


		def create

				credentials = JSON.parse(params[:data_value])
				email = credentials['email']
			    password = credentials['password']
			    password_confirm = credentials['password_confirm']

			    user = User.new(email: email, password: password, password_confirmation: password_confirm)
			    if user.save
			      render json: user, status: 201, location: [:v1, user]
			    else
			      render json: { errors: user.errors }, status: 422
				end
			end
	end
end