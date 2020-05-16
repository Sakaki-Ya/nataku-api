module JsonWebToken
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  
    def self.encode(payload)
        JWT.encode(payload, SECRET_KEY, "HS256")
    end
  
    def self.decode(token)
        decoded = JWT.decode(token, SECRET_KEY, true, "HS256")[0]
        HashWithIndifferentAccess.new decoded
    end
end