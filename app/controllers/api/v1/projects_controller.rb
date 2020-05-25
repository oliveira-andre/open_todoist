# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :load_user
      before_action :load_projects, only: :index
      before_action :load_project, only: :destroy

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

      def destroy
        @project.archived!
        success_response(data: @project, model: 'Project', status: :ok)
      end

      private

      def projects_params
        params.require(:projects).permit(:title).merge(user: @user)
      end

      def load_projects
        @projects = @user.projects.active.includes(:tasks)
                         .where(tasks: { status: 0 }).distinct
      end

      def load_project
        @project = @user.projects.find(params[:id])
      end
    end
  end
end
