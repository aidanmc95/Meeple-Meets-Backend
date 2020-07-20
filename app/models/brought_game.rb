class BroughtGame < ApplicationRecord
  belongs_to :boardgame
  belongs_to :meet
end
