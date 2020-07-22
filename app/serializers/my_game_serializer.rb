class BoardgameSerializer < ActiveModel::Serializer
    attributes :id

    belongs_to :boardgame
    class BoardgameSerializer < ActiveModel::Serializer
        attributes :id, :title, :thumbnail, :BGGrating, :BGGrank
    end      
end
  