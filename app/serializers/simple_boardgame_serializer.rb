class SimpleBoardgameSerializer < ActiveModel::Serializer
  attributes :id, :title, :thumbnail, :BGGrating, :BGGrank
end
