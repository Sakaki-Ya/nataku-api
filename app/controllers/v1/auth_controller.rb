class V1::AuthController < ApplicationController
  before_action :auth_request, only: :sign_out

  def sign_up
    @user = User.create(user_params)
    render json: @user
  end
    
  def sign_in
    @user = User.find_by_email(params[:email])
    @user&.authenticate(params[:password])
    payload = {"id" => @user.id, "exp" => 2.weeks.from_now.to_i}
    token = JsonWebToken.encode(payload)
    render json: { token: token }
  end

  def sign_out
    # payload = { "exp" => 1.seconds.from_now.to_i}
    # token = JsonWebToken.encode(payload)
    # render json: { token: token }
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
