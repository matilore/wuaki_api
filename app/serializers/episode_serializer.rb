class EpisodeSerializer < ActiveModel::Serializer
  attributes :episode_number, :title, :plot

  def episode_number
  	object.id
  	
  end
end
