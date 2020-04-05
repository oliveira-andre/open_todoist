# frozen_string_literal: true

class Task < ApplicationRecord
  enum status: { opened: 0, finalized: 1, archived: 2 }

  belongs_to :user
  belongs_to :project

  validates :title, :status, :schedule_date, :user_id, :project_id,
            presence: true
end
