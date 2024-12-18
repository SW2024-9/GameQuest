class User < ApplicationRecord
    #12/18
    has_secure_password
    ####
    
    
    
    #12/4
    #検索方法分岐
    def self.looks(search, word)
        if search == "perfect_match"
            @user = User.where("name LIKE?", "#{word}")
        elsif search == "forward_match"
            @user = User.where("name LIKE?","#{word}%")
        elsif search == "backward_match"
            @user = User.where("name LIKE?","%#{word}")
        elsif search == "partial_match"
            @user = User.where("name LIKE?","%#{word}%")
        else
            @user = User.all
        end
    end
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
