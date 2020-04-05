# frozen_string_literal: true

class Project < ApplicationRecord
  enum status: { active: 0, finalized: 1, archived: 2 }

  validates :title, :status, :schedule_date, presence: true
end
