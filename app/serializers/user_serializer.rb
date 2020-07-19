class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :boardgames
  class BoardgameSerializer < ActiveModel::Serializer
    attributes :id, :title, :thumbnail, :BGGrating
  end
end
