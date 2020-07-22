class InviteSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at

  belongs_to :user
  belongs_to :meet

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :username
  end

  class MeetSerializer < ActiveModel::Serializer
    attributes :id, :description, :size, :name, :when
  end
end
