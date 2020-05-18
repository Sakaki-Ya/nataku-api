class V1::AuthController < ApplicationController
  before_action :auth_request, only: :sign_out
  # after_action :auth_request, only: :sign_up

  def sign_up
    @user = User.create(user_params)
    # JsonWebToken.encode(@user)
    render json: @user
  end
    
  def sign_in
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(@user)
      render json: { token: token }
    else
      render json: { error: "There is an error in your email address or password." }
    end
  end

  def sign_out
    current_jti = @decoded["jti"]
    if UsedToken.find_by(jti: current_jti)
      render json: { error: "Already signed out." }
    else
      usedToken = UsedToken.create(jti: current_jti)
      render json: usedToken
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
