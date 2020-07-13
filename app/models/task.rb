# frozen_string_literal: true

class Task < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  enum status: { opened: 0, finalized: 1, archived: 2 }

  belongs_to :project

  validates :title, :status, :project_id, presence: true
end
