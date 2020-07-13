# frozen_string_literal: true

module FlashBriefing
  def main_text(projects)
    message = ''

    projects.each_with_index do |project, index|
      message += "On the project #{project.title} do you have the following "\
        "tasks: "

      project.tasks.each_with_index do |task, task_index|
        message += task.title
        message += project.tasks.length == (task_index + 1) ? '.' : ', ' 
      end

      message += " and " unless projects.length == (index + 1)
    end

    message
  end
end

