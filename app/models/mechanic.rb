class Mechanic < ApplicationRecord
    has_many :game_mechanics, dependent: :destroy
    has_many :boardgames, through: :game_mechanics
end
