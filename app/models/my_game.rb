class MyGame < ApplicationRecord
  belongs_to :boardgame
  belongs_to :user
end
