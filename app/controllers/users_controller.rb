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
  
  
  #12/18
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
<<<<<<< HEAD
    signup_password = BCrypt::Password.create(params[:user][:pass])
    u = User.new(name: params[:user][:name], pass: signup_password, email: params[:user][:email], address: params[:user][:address])
    u.save
    redirect_to users_path
=======
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
>>>>>>> 92cacdf3a15fd2ab89464829a9a8e992a10609bf
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :pass, :email, :address)  # 必要なパラメータを追加
  end
  
end
