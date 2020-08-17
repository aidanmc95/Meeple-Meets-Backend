class SimpleUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :about_me, :as_host, :created_at

  has_many :boardgames
  has_many :invites
  has_many :meets
  class BoardgameSerializer < ActiveModel::Serializer
    attributes :id, :title, :thumbnail, :BGGrating, :BGGrank
  end
end
