# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :load_user
      before_action :load_projects, only: :index

      def index
        success_response(data: @projects, model: 'Project')
      end

      def create
        @project = Project.create!(projects_params)

        if @project
          success_response(data: @project, model: 'Project', status: :created)
        else
          error_response
        end
      end

      private

      def projects_params
        params.require(:projects).permit(:title).merge(user: @user)
      end

      def load_projects
        @projects = @user.projects
      end
    end
  end
end
