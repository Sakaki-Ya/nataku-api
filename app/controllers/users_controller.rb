require "jwt"

class UsersController < ApplicationController
    def signin
    end

    def show
        @user = User.find(params[:id])
        redirect_to "/"
    end

    def create
        @user = User.create(user_params)
        redirect_to "/"
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to "/"
    end

    def destroy
        User.find(params[:id]).destroy
        redirect_to "/"
    end

    def attach_avatar
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to "/"
    end

    private
    def user_params
        params.require(:user).permit(:name, :avatar, :email, :password_digest)
    end
end
