class User < ApplicationRecord
    has_many :posts
    mount_uploader :avatar, AvatarUploader
    has_secure_password
    
    attr_accessor :current_user

    validates :name, length: { minimum: 1, maximum: 10,
        message: "Must be between 1 and 10 characters." }
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
        message: "Not a valid email address." }, uniqueness: true
    validates :password, format: { with: /\A[a-z\d]{8,100}+\z/i,
        message: "Must have at least 8 alphanumeric characters." }
end
