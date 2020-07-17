class GameCategory < ApplicationRecord
  belongs_to :category
  belongs_to :boardgame
end
