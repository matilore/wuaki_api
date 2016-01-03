class Movie < ActiveRecord::Base
	has_many :purchases, as: :purchasable
end
