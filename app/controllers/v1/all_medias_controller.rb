module V1
	class AllMediasController < ApiController

		before_action :authenticate_with_token!, only: [:index]

		def index

			@movies = Movie.all
			@series = Serie.all

			all_media = (@movies + @series)
			all_media.sort! { |a,b| b.created_at <=> a.created_at }
			render json: all_media		
		end
	end
end