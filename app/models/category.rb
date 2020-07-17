class Category < ApplicationRecord
    has_many :game_categories
    has_many :boardgames, through: :game_categories
end
