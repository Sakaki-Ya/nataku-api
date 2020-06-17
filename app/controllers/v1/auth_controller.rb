class V1::AuthController < ApplicationController
  before_action :auth_request, only: :sign_out

  def sign_up
    @user = User.create!(user_params)
    render_user(@user)
  end

  def sign_in
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      render_user(@user)
    else
      render json: { error: "There is an error in your email address or password." }
    end
  end

  def sign_out
    current_jti = @decoded["jti"]
    if UsedToken.find_by(jti: current_jti)
      render json: { error: "Already signed out." }
    else
      usedToken = UsedToken.create!(jti: current_jti)
      render json: usedToken
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def render_user(user)
    response = ActiveModelSerializers::SerializableResource.new(user, serializer: UserSerializer, root: 'user', adapter: :json).as_json
    response[:token] = JsonWebToken.encode(user)
    render json: response
  end
end
