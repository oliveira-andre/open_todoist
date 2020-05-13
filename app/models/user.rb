# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :vinculate_score

  enum status: { active: 0, deactive: 1 }

  belongs_to :score

  has_many :projects

  validates :email, :password, :status, :score_id, presence: true

  private

  def vinculate_score
    self.score_id = Score.create.id
  end
end
