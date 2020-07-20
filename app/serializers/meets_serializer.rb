class MeetsSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :creator
  has_many :invites
  has_many :boardgames
  class BoardgameSerializer < ActiveModel::Serializer
    attributes :id, :title, :thumbnail, :BGGrating
  end
end
