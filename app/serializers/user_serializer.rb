class UserSerializer < ActiveModel::Serializer
  attributes :id, :avatar

  has_one :profile
end
