# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: { active: 0, deactive: 1 }

  belongs_to :score

  has_many :tasks

  validates :email, :password, :status, :score_id, presence: true
end
