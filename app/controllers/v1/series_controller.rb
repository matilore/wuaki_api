module V1
	class SeriesController < ApiController
		
		before_action :authenticate_with_token!, only: [:index, :show]
		
		def index
			series = Serie.all.order(created_at: :desc)
			render json: series, status: 200	
		end

		def show

			serie = Serie.find_by(id: params[:id])
			render json: serie, status: 200			
		end
	end
end