# frozen_string_literal: true

module Api
  module V1
    class SessionSerializer < ActiveModel::Serializer
      attributes :authentication_token
    end
  end
end
