# frozen_string_literal: true

module Api
  module V1
    class ProjectSerializer < ActiveModel::Serializer
      attributes :id, :title, :schedule_date

      has_many :tasks, each_serializer: TaskSerializer
    end
  end
end
