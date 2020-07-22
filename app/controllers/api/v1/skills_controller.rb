module Api
  module V1
    class SkillsController < ApplicationController
      before_action :load_user
      before_action :load_projects

      def index
        success_response(data: @projects, status: :ok, model: 'Project')
      end

      private

      def load_projects
        @projects = @user.projects.active.includes(:tasks)
          .where(tasks: { status: 0, order: 0..4 }).distinct.limit(5)
      end
    end
  end
end

