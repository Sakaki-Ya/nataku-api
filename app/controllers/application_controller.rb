class ApplicationController < ActionController::API
    def auth_request
        header = request.headers["Authorization"]
        token = header.split(" ").last if header
        begin
            @decoded = JsonWebToken.decode(token)
            @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }
        rescue JWT::DecodeError => e
            render json: { text: e.message }
        end
    end
end
