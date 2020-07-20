class Designer < ApplicationRecord
    has_many :game_designers, dependent: :destroy
    has_many :boardgames, through: :game_designers
end
