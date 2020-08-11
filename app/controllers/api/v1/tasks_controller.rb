# frozen_string_literal: true

module Api
  module V1
    class TasksController < ApplicationController
      before_action :load_user, :load_project
      before_action :load_task, only: :destroy

      def create
        @task = Task.create(tasks_params)

        if @task.valid?
          success_response(data: @task, model: 'Task', status: :created)
        else
          error_response
        end
      end

      def destroy
        @task.archived!
        success_response(data: @task, model: 'Task', status: :ok)
      end

      private

      def load_project
        @project = @user.projects.find(params[:project_id])
      end

      def load_task
        @task = @project.tasks.find(params[:id])
      end

      def tasks_params
        params.require(:tasks).permit(:title, :description)
              .merge(project_id: @project.id)
      end
    end
  end
end
