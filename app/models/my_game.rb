class MyGame < ApplicationRecord
  belongs_to :boardgames
  belongs_to :user
end
