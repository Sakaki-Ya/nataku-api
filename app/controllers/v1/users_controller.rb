class V1::UsersController < ApplicationController
    before_action :auth_request, :id_check

    def show
        render json: current_user
    end

    def update
        current_user.update!(user_params)
        render json: current_user
    end

    def destroy
        current_user.destroy
    end

    def attach_avatar
        current_user.avatar = params[:avatar]
        render json: current_user
    end

    private
    def user_params
        params.require(:user).permit(:name, :avatar)
    end

    def id_check
        if params[:id].to_i != current_user["id"]
            render json: { error: "It is not authorized." }
        end
    end
end
