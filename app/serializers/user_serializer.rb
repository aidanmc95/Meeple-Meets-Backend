class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :BGGusername, :address1, :address2, :zip, :email, :about_me, :as_host, :created_at

  has_many :my_games
  has_many :boardgames, through: :my_games

  has_many :meets
  has_many :invites

  class BoardgameSerializer < ActiveModel::Serializer
    attributes :id, :title, :thumbnail, :BGGrating, :BGGrank
  end  
end
