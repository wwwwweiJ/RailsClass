class User < ApplicationRecord
    validates :eamil , presence: true , uniqueness: true
    validates :username , presence: true , uniqueness: true
    validates :password , presence: true
end
