class SimpleMeetSerializer < ActiveModel::Serializer
  attributes :id, :description, :size, :name, :when, :zip

  belongs_to :user
  has_many :invites
  has_many :brought_games
end
