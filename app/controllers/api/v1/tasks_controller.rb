# frozen_string_literal: true

module Api
  module V1
    class TasksController < ApplicationController
      before_action :load_user, :load_tasks

      def index
        success_response(data: @tasks, model: 'Task')
      end

      private

      def load_tasks
        @tasks = @user.tasks.opened
      end
    end
  end
end
