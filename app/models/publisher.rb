class Publisher < ApplicationRecord
    has_many :game_publishers
    has_many :boardgames, through: :game_publishers
end
