class User < ApplicationRecord
    #12/18
    #has_secure_password
    ####
    require 'bcrypt'
    
    
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
    #before_save :encrypt_password

    #private

    #def encrypt_password
        #if pass.present? && !BCrypt::Password.valid_hash?(pass)
            #self.pass = BCrypt::Password.create(pass)
        #end
    #end
    ##############################################################
    #1/15
    

    
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :address, presence: true
    validates :pass, presence: true
    
    before_save :encrypt_password

    private

    def encrypt_password
      #if pass_changed? # パスワードが更新された場合のみ
       # self.pass = BCrypt::Password.create(pass)
      #end
      if pass.present? && (pass_changed? || new_record?)
        self.pass = BCrypt::Password.create(pass)
      end
    end
    
end
