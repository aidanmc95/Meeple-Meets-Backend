class GameDesigner < ApplicationRecord
  belongs_to :boardgame
  belongs_to :designer

  validates :designer, uniqueness: { scope: :boardgame }
end
