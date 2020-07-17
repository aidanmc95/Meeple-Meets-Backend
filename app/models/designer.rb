class Designer < ApplicationRecord
    has_many :game_designers
    has_many :boardgames, through: :game_designers
end
