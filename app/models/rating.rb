class Rating < ApplicationRecord
  belongs_to :boardgames
  belongs_to :user
end
