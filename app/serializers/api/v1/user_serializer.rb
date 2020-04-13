module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :email
    end
  end
end
