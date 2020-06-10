class ApplicationController < ActionController::API
    attr_reader :current_user
    
    def auth_request
        header = request.headers["Authorization"]
        token = header.split(" ").last if header
        if token != nil
            @decoded = JsonWebToken.decode(token)
            @current_user = User.find(@decoded[:sub])
        end
    end
end