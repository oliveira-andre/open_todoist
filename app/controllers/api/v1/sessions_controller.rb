# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      before_action :sign_in_params, only: :create
      before_action :load_user

      def create
        if valid_password?
          success_response(data: @user, model: 'Session', status: :created)
        else
          error_response
        end
      end

      def sign_in_params
        params.require(:users).permit(:email, :password)
      end

      def load_user
        @user = User.find_by(email: sign_in_params[:email])
      end

      def valid_password?
        @user.valid_password?(sign_in_params[:password])
      end
    end
  end
end
