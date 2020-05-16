class ApplicationController < ActionController::API
    def auth_request
        header = request.headers["Authorization"].split(" ").last
        begin
            decoded = JsonWebToken.decode(header)
            @current_user = User.find(decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }
        rescue JWT::DecodeError => e
            render json: { errors: e.message }
        end
    end
end
