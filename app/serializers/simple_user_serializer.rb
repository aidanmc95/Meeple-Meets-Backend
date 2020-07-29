class SimpleUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :about_me, :as_host, :created_at

  has_many :boardgames
  class BoardgameSerializer < ActiveModel::Serializer
    attributes :id, :title, :thumbnail, :BGGrating, :BGGrank
  end
end
