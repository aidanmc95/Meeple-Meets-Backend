class Boardgame < ApplicationRecord
    has_many :ratings, dependent: :destroy
    
    has_many :game_categories, dependent: :destroy
    has_many :categories, through: :game_categories

    has_many :game_mechanics, dependent: :destroy
    has_many :mechanics, through: :game_mechanics

    has_many :game_designers, dependent: :destroy
    has_many :designers, through: :game_designers

    has_many :game_publishers, dependent: :destroy
    has_many :publishers, through: :game_publishers

    has_many :my_games, dependent: :destroy

    accepts_nested_attributes_for :game_categories
    accepts_nested_attributes_for :game_mechanics
    accepts_nested_attributes_for :game_designers
    accepts_nested_attributes_for :game_publishers
end
