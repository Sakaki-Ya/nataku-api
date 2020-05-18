module JsonWebToken
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  
    def self.encode(user)
        id = user.id
        iat = Time.now.to_i
        jti = Digest::MD5.hexdigest([SECRET_KEY, iat].join(":").to_s)
        exp = 2.weeks.from_now.to_i
        payload = { user_id: id, jti: jti, exp: exp }
        JWT.encode(payload, SECRET_KEY, "HS256")
    end
  
    def self.decode(token)
        decoded = JWT.decode(token, SECRET_KEY, true, algorithm: "HS256")[0]
        HashWithIndifferentAccess.new decoded
    end
end