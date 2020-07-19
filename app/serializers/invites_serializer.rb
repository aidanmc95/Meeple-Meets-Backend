class InvitesSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at

  belongs_to :user
end
