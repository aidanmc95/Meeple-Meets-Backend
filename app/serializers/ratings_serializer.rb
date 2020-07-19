class RatingsSerializer < ActiveModel::Serializer
  attributes :id, :rating

  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :id
  end
end
