class MyGame < ApplicationRecord
  belongs_to :boardgame
  belongs_to :user

  has_many :brought_games, dependent: :destroy

  validates :boardgame, uniqueness: { scope: :user }
end
