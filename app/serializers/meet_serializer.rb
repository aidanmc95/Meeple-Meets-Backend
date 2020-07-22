class MeetSerializer < ActiveModel::Serializer
  attributes :id, :description, :size, :name, :when, :location

  belongs_to :user
  has_many :invites
  has_many :boardgames
end
