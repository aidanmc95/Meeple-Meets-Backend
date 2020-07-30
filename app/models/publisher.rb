class Publisher < ApplicationRecord
    has_many :game_publishers, dependent: :destroy
    has_many :boardgames, through: :game_publishers

    validates :name, presence: true
end
