# frozen_string_literal: true

module Devise
  class SessionsController < DeviseController
    before_action :configure_sign_in_params, only: :create
    before_action :load_user

    def create
      if @user.valid_password?(configure_sign_in_params[:password])
        cookies['Authorization'] = "Bearer #{@user.authentication_token}"
        render json: { message: 'you are signed in' }, status: 202
      else
        render json: { message: 'Email or Password is wrong' }, status: 422
      end
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    protected

    def configure_sign_in_params
      params.require(:users).permit(:email, :password)
    end

    def load_user
      @user = User.find_by(email: configure_sign_in_params[:email])
    end
  end
end
