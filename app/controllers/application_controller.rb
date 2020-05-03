# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Response

  private

  def load_user
    @user = User&.find_by(authentication_token: request.headers['token'])
  end
end
