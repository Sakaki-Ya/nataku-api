class ApplicationController < ActionController::API
    attr_accessor :current_user

    def auth_request
        header = request.headers["Authorization"]
        token = header.split(" ").last if header
        begin
            @decoded = JsonWebToken.decode(token)
            @current_user = ApplicationController.new
            @current_user.current_user = User.find(@decoded[:sub])
        rescue ActiveRecord::RecordNotFound => e
            render json: { error: e.message }
        rescue JWT::DecodeError => e
            render json: { error: e.message }
        end
    end
end
