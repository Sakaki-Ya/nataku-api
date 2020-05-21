class UsedToken < ApplicationRecord
    validates :jti, presence: true
end
