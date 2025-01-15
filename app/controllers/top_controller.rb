class TopController < ApplicationController
    def main
        if session[:login_name]
            #redirect_to top_main_path
            @current_user = User.find_by(name: session[:login_name])
            render "login"
        else
            render "login"
        end
    end
    
    def login
        #if params[:uid] == 'kindai' and params[:pass] == 'sanriko'
        user = User.find_by(name: params[:name])
        #if user and BCrypt::Password.new(user.pass) == params[:pass]
            #session[:login_uid] = params[:uid]
            #redirect_to top_main_path
        if user && BCrypt::Password.new(user.pass) == params[:pass] # 暗号化されたパスワードと比較
            #session[:login_uid] = user.uid
            session[:login_name] = params[:name]
            redirect_to top_index_path
        else
            render "error", status: 422
        end
    end
    
    ########
    
    
    def logout
        session.delete(:login_name)
        redirect_to root_path
    end
    
    def index
        @products = Product.all  # 商品の一覧を取得
    end
    
    def user_signed_in?
        session[:login_name].present?
    end
    


  # ログアウト処理
  #def logout
   # session[:user_id] = nil # セッションをクリア
  #  redirect_to login_path, notice: 'ログアウトしました。'
  #end

  #private

  # ログインしているユーザーを取得
  #def current_user
  #  @current_user ||= User.find_by(id: session[:user_id])
 # end

  # ログインが必要なアクションに適用
  #def require_login
  #  unless current_user
 #     redirect_to login_path, alert: 'ログインしてください。'
#    end
  #end
#end
################################################################################ 



end