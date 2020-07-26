class BroughtGameSerializer < ActiveModel::Serializer
    attributes :id

    belongs_to :my_game
    has_one :boardgame, serializer: SimpleBoardgameSerializer
    has_one :user, serializer: SimpleUserSerializer
end
  