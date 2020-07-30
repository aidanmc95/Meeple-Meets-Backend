class GameMechanic < ApplicationRecord
  belongs_to :mechanic
  belongs_to :boardgame

  validates :mechanic, uniqueness: { scope: :boardgame }
end
