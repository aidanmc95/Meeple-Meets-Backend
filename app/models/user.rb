class User < ApplicationRecord
    has_many :my_games
    has_many :boardgames, through: :my_games

    has_many :ratings

    has_many :posts, as: :my_posts

    has_many :invites
    has_many :posts, through: :invites

    has_secure_password
end
