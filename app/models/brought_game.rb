class BroughtGame < ApplicationRecord
  belongs_to :my_game
  belongs_to :meet

  has_one :boardgame, through: :my_game
  has_one :user, through: :my_game
end
