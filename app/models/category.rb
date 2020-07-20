class Category < ApplicationRecord
    has_many :game_categories, dependent: :destroy
    has_many :boardgames, through: :game_categories
end
