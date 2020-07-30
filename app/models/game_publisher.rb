class GamePublisher < ApplicationRecord
  belongs_to :boardgame
  belongs_to :publisher

  validates :publisher, uniqueness: { scope: :boardgame }
end
