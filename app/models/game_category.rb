class GameCategory < ApplicationRecord
  belongs_to :category
  belongs_to :boardgame

  validates :category, uniqueness: { scope: :boardgame }
end
