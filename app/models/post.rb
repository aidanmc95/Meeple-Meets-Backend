class Post < ApplicationRecord
    belongs_to :user, as: :creator

    has_many :invites
    has_many :users, through: :invites

    has_many :brought_games
    has_many :boardgames, through: :brought_games
end
