class UsersController < ApplicationController
  #require 'bcrypt'
  #def index
   # @users = User.all
  #end

  #def new
  #  @user = User.new
  #end
  
  #def create
    #signup_password = BCrypt::Password.create(params[:user][:pass])
    #u = User.new(uid: params[:user][:uid], pass: signup_password)
    #u.save
   # redirect_to users_path
  #end
  
  
  
  #12/15
  #before_save :encrypt_password


  def encrypt_password
    if pass_changed? # パスワードが更新された場合のみ
      self.pass = BCrypt::Password.create(pass)
    end
  end
  
  
  #12/18
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  #def create
   # signup_password = BCrypt::Password.create(params[:user][:pass])
    #u = User.new(name: params[:user][:name], pass: signup_password, email: params[:user][:email], address: params[:user][:address])
    #u.save
    #redirect_to users_path
  #end
  
  #private

  #def user_params
    #params.require(:user).permit(:name, :pass, :email, :address)  # 必要なパラメータを追加
  #end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'ユーザーが登録されました。'
      
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :pass)
  end
  
  
  
  
  
  def show
    @user = User.find_by(id: params[:id])
    # idが見つからない場合の処理を追加することもできます
    if @user.nil?
      flash[:alert] = "ユーザーが見つかりません"
      redirect_to users_path
    end
  end
  
  
  
end
