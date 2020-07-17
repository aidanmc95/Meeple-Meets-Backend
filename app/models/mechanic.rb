class Mechanic < ApplicationRecord
    has_many :game_mechanics
    has_many :boardgames, through: :game_mechanics
end
