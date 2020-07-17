class BroughtGame < ApplicationRecord
  belongs_to :boardgame
  belongs_to :post
end
