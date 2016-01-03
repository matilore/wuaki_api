module V1
	class MoviesController < ApiController

		before_action :authenticate_with_token!, only: [:index, :show]



		def index
			movies = Movie.all.order(created_at: :desc)
			render json: movies, status: 200
		end

		def show
			movie = Movie.find_by(id: params[:id])
			render json: movie, status: 200
		end
	end
end
