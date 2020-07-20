class User < ApplicationRecord
    has_many :my_games, dependent: :destroy
    has_many :boardgames, through: :my_games

    has_many :ratings, dependent: :destroy

    has_many :meets, foreign_key: "user_id", dependent: :destroy

    has_many :invites, dependent: :destroy
    # has_many :invited_meets, through: :invites

    has_secure_password
end
