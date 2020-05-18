class UsedToken < ApplicationRecord
    has_one :user

    validates :jti, presence: true
end
