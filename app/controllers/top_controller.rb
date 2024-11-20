class TopController < ApplicationController
    def main
        if session[:login_uid]
            redirect_to tweets_path
        else
            render "login"
        end
    end
    
    def login
        #if params[:uid] == 'kindai' and params[:pass] == 'sanriko'
        user = User.find_by(uid: params[:uid])
        if user and BCrypt::Password.new(user.pass) == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to top_main_path
        else
            render "error", status: 422
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
    
    
    
#Topページのコード
##############################################################################
#class TopController < ApplicationController
#  before_action :require_login, only: [:main]
#
  # ログインページの表示
  #def login
  #end

  # ログイン処理
#  def create_session
#    user = User.find_by(name: params[:name])

#    if user&.authenticate(params[:password]) # パスワードを検証
#      session[:user_id] = user.id # セッションにユーザーIDを保存
#      redirect_to main_path, notice: 'ログインしました。'
#    else
#      flash[:alert] = 'ユーザー名またはパスワードが間違っています。'
#      render :login
#    end
#  end

  # メインページ
#  def main
#    @current_user = current_user
#    @wishlist_items = @current_user.wishlist_items || []
#  end

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