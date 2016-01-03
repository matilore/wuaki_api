class OneWeekSerializer < ActiveModel::Serializer
  attributes :id, :purchasable_id, :purchasable_type, :created_at, :updated_at, :user_id, :hd, :type, :media_title, :price, :expiration_time


   def media_title

    media = object.purchasable_type.constantize
    
    if media == Season
      season = media.find_by(id: purchasable_id)

      serie = Serie.find_by(id: season.serie_id)
      serie_title = serie.title
    else
       media = media.find_by(id: purchasable_id)
       movie_title = media.title
    end
  end

end
