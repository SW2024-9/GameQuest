class Product < ApplicationRecord
    # 必要に応じて、ransack用のカスタムメソッドを定義することも可能
    #12/4検索方法分岐
    ###################################
    def self.looks(search, word)
        if search == "perfect_match"
            @product = Product.where("title LIKE?","#{word}")
        elsif search == "forward_match"
            @product = Product.where("title LIKE?","#{word}%")
        elsif search == "backward_match"
            @product = Product.where("title LIKE?","%#{word}")
        elsif search == "partial_match"
            @product = Product.where("title LIKE?","%#{word}%")
        else
            @product = Product.all
        end
    end
    ###################################
    has_one_attached :file  # ここでfileを添付できるように設定
end
