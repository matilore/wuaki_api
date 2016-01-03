class SerieSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :seasons
end
