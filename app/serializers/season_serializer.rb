class SeasonSerializer < ActiveModel::Serializer
  attributes :season_number
  has_many :episodes

  def season_number
  	object.id
  	
  end
end
