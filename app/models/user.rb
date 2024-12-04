class User < ApplicationRecord
    #12/4
    ##############################################################
    before_save :encrypt_password

    private

    def encrypt_password
        if pass.present? && !BCrypt::Password.valid_hash?(pass)
            self.pass = BCrypt::Password.create(pass)
        end
    end
    ##############################################################
end
