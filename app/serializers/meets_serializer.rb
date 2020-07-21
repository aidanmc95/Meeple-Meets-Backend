class MeetsSerializer < ActiveModel::Serializer
  attributes :id, :description, :size, :name, :when

  belongs_to :user
  has_many :invites
  has_many :boardgames
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :username
  end
  
  class BoardgameSerializer < ActiveModel::Serializer
    attributes :id, :title, :thumbnail, :BGGrating
  end
end
