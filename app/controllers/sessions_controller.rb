class SessionsController < ApplicationController
  def create
    # ログイン処理の例。ここではユーザー名とパスワードを簡易的に確認しています。
    name = params[:name]
    pass = params[:pass]

    if name == "test_user" && pass == "password123"  # 仮の認証
      redirect_to main_path, notice: "ログインに成功しました！"
    else
      redirect_to root_path, alert: "ユーザー名またはパスワードが間違っています。"
    end
  end
  
  
  #ログアウト機能
  def destroy
    reset_session # 現在のセッションを破棄
    redirect_to root_path, notice: "ログアウトしました"
  end
  #######################################################

end
