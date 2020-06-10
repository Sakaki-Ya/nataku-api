class V1::PostsController < ApplicationController
    before_action :post_params, only: :create

    def index
        @posts = Post.all
        render json: @posts
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def create
        @post = Post.create!(post_params)
        render json: @post
    end

    private
    def post_params
        auth_request()
        if current_user == nil then
            params.require(:post).permit(:content)
        else
            postData = params.require(:post).permit(:content)
            postData[:user_id] = current_user.id
            return postData
        end
    end
end