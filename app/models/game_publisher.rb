class GamePublisher < ApplicationRecord
  belongs_to :boardgame
  belongs_to :publisher
end
