module Api
  module V1
    module Alexa
      class FlashBriefingsController < ApplicationController
        before_action :load_user
        before_action :load_projects

        def index
          alexa_sales_briefing_response(projects: @projects)
        end

        private

        def load_projects
          @projects = @user.projects.active.includes(:tasks)
            .where(tasks: { status: 0 }).distinct.limit(5)
        end
      end
    end
  end
end

