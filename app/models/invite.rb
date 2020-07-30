class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :meet

  validates :user, uniqueness: { scope: :meet }
end
