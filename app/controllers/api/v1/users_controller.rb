module Api
  module V1
    class UsersController < ApplicationController
      before_action :load_user

      def show
        success_response(data: @user, model: 'User') if @user
        error_response(data: '') unless @user
      end

      private

      def load_user
        @user = User&.find_by(authentication_token: params[:token])
      end
    end
  end
end
