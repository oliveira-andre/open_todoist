# frozen_string_literal: true

class Task < ApplicationRecord
  default_scope -> { order(order: :desc) }

  enum status: { opened: 0, finalized: 1, archived: 2 }

  belongs_to :project

  validates :title, :status, :project_id, presence: true

  before_save :set_order

  private

  def set_order
    downgrade_orders if archived?
    return if order_changed?

    self.order = new_record? ? opened_tasks_count : archived_tasks_count
  end

  def downgrade_orders
    tasks = project.tasks.opened.where('tasks.order > ?', order)
    tasks.each { |task| task.update(order: (task.order - 1)) }
  end

  def opened_tasks_count
    project.tasks.opened.count || 0
  end

  def archived_tasks_count
    project.tasks.archived.count || 0
  end
end
