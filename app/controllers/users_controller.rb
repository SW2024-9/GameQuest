class UsersController < ApplicationController
  require 'bcrypt'
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    signup_password = BCrypt::Password.create(params[:user][:pass])
    u = User.new(uid: params[:user][:uid], pass: signup_password)
    u.save
    redirect_to users_path
  end
end
