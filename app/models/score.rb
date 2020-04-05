# frozen_string_literal: true

class Score < ApplicationRecord
  enum rank: { iron: 0, bronze: 1, silver: 2, gold: 3, platinum: 4, diamound: 5,
               master: 6, grand_master: 7, challenger: 8 }

  has_one :user

  validates :points, :rank, presence: true
end
