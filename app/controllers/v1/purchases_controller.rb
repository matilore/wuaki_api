module V1
	class PurchasesController < ApiController
		
		before_action :authenticate_with_token!, only: [:index, :create]
		
		
		def index			
			purchases = Purchase.all
			render json: purchases			
		end

		def create

			purch_data = JSON.parse(params[:data_value])

			user_id = purch_data['user_id']
			media_type = purch_data['media_type']
			media_id = purch_data['media_id']			
			quality = purch_data['quality']
			length = purch_data['length']
			user = User.find_by(id: user_id)

			media_type = media_type.capitalize.constantize

			media = media_type.find_by(id: media_id)

			length = length.constantize

			quality == 'hd' ? quality = true : quality = false

			price = nil

			quality == false ? price = length.price : price = length.priceHD			

			if media.purchases << length.new(user_id: user.id, hd: quality, price: price)

				render json: user, status: 200
			else
				render json: { errors: "Something wrong with purchase data" }, status: 422
			end
			

		end



		private

		def expiration_time_stamp

			
		end

	end
end
