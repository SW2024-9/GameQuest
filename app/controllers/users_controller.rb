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
    u = User.new(name: params[:user][:name], pass: signup_password, email: params[:user][:email], address: params[:user][:address])
    u.save
    redirect_to users_path
  end
end
