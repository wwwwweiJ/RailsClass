class User < ApplicationRecord
    has_many :resumes
    validates :email , presence: true , uniqueness: true
    validates :username , presence: true , uniqueness: true
    validates :password , presence: true , confirmation: true , length: { minimum: 6 }
    before_create :encrypt_password

    def default_resume 
        resumes.first 
    end

    def self.login(user_data)
        account = user_data[:account]
        password = user_data[:password]
        if account && password
            user = User.find_by("email = ? or username = ?" , account , account)
            if user && user.password == Encoder::EncoderPassword.encode_password(password)
                user
            else
                nil
            end
        else
            nil
         end
    end
    private
    def encrypt_password
        self.password = Encoder::EncoderPassword.encode_password(self.password)
    end

end
