class BroughtGame < ApplicationRecord
  belongs_to :my_game
  belongs_to :meet

  has_one :boardgame, through: :my_game
  has_one :user, through: :my_game

  validate :no_duplicate_games

  def no_duplicate_games
    meet = Meet.find(meet_id)
    my_game = MyGame.find(my_game_id)
    current_boardgame = my_game.boardgame
    if(!!meet.boardgames.find{|boardgame| boardgame == current_boardgame})
      errors.add(:duplicate_game, "has already been added")
    end
  end
end
