class BoardgameSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :BGGrating, :BGGrank, :playtime, :minplayers, :maxplayers

  has_many :ratings
  has_many :categories
  has_many :mechanics
  has_many :designers
  has_many :publishers
end
