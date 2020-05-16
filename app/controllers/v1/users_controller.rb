class V1::UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    def destroy
        User.find(params[:id]).destroy
    end

    def attach_avatar
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    private
    def user_params
        params.require(:user).permit(:name, :avatar, :email, :password)
    end
end
