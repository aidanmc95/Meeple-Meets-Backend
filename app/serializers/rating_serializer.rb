class RatingSerializer < ActiveModel::Serializer
  attributes :id, :rating

  belongs_to :user
end
