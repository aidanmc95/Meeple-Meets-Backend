class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :address, :BGGusername

  has_many :my_games
  has_many :boardgames, through: :my_games

  class BoardgameSerializer < ActiveModel::Serializer
    attributes :id, :title, :thumbnail, :BGGrating, :BGGrank
  end  
end
