class V1::PostsController < ApplicationController
    before_action :auth_request, only: :create
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
        postData = post_params
        if current_user != nil
            postData[:user_id] = current_user.id
        end
        @post = Post.create!(postData)
        render json: @post
    end

    private
    def post_params
        params.require(:post).permit(:content)
    end
end