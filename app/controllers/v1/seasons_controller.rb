module V1
	class SeasonsController < ApiController
		before_action :authenticate_with_token!, only: [:show]

		def show
				season = Season.find_by(id: params[:id])
				render json: season, status: 200			
		end
	end
end