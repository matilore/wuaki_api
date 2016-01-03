class TwoDay < Purchase

	after_save :expiration

	def self.price
		price = 3		
	end

	def self.priceHD

		price = price()
		price +=  1
		
	end


	def expiration
		expiration_time = Time.at(self.created_at.to_i + 172800)
		update_column(:expiration_time, expiration_time)
	end

end