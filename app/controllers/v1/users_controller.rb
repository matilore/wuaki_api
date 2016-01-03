module V1
	class UsersController < ApiController
		before_action :authenticate_with_token!, only: [:show, :destroy]

			def show
				user = User.find_by(id: params[:id])
				if user
					render json: user, status: 200
				else
					render json: { errors: user.errors }, status: 422
				end
			end
	end
end