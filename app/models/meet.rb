class Meet < ApplicationRecord
    belongs_to :user

    has_many :invites, dependent: :destroy
    has_many :users, through: :invites

    has_many :brought_games, dependent: :destroy
    has_many :boardgames, through: :brought_games
end
