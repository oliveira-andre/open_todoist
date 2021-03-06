# frozen_string_literal: true

class Project < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  enum status: { active: 0, finalized: 1, archived: 2 }

  validates :title, :status, presence: true

  belongs_to :user
  has_many :tasks

  before_save :archive_tasks

  private

  def archive_tasks
    return unless status == 'archived'

    tasks.each(&:archived!)
  end
end
