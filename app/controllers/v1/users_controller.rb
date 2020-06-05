class V1::UsersController < ApplicationController
    before_action :auth_request, :id_check

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
        @user.avatar = params[:avatar]
        @user.save
        render json: @user
    end

    private
    def user_params
        params.require(:user).permit(:name, :avatar)
    end

    def id_check
        if params[:id].to_i != current_user.id
            render status: 401, json: { error: "It is not authorized." }
        end
    end
end
