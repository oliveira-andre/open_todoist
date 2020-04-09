class HomeController < ApplicationController
  before_action :load_tasks

  def index; end

  private

  def load_tasks
    @tasks = Task.all
  end
end

