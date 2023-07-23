class User < ApplicationRecord
    has_secure_password

    validates :email , presence: true , format: { with: /\w+([\.-]?\w+)*@\w+([\.-]?\w+)/, message: " must be a vaild email address" }
end
