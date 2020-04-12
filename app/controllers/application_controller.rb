# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def user_signed_in?
    current_user.present?
  end

  def current_user
    User.find_by(authentication_token: token)
  end

  private

  def token
    cookies['Authorization']&.delete('Bearer ')
  end
end
