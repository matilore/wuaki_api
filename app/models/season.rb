class Season < ActiveRecord::Base
	has_many :purchases, as: :purchasable
	belongs_to :serie
	has_many :episodes
end
