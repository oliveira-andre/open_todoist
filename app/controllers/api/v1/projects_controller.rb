# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :load_user, :load_projects

      def index
        success_response(data: @projects, model: 'Project')
      end

      private

      def load_projects
        @projects = Project.joins(:tasks).where(tasks: { user_id: @user.id })
      end
    end
  end
end
