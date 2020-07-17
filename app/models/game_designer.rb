class GameDesigner < ApplicationRecord
  belongs_to :boardgame
  belongs_to :designer
end
