class UserController < ApplicationController
  protect_from_forgery
  before_action :access_control, { only: [:account, :profile, :edit, :update] }
  def sign_in
  
  end

  def login
    if params[:email].present? && params[:password].present?
      @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to("/")
      else
        render("user/sign_in")
      end
    else
      @user = User.new
      @user.errors.add(:base, "メールアドレス、パスワードを入力してください")
      render("user/sign_in")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], user_img: "defult_user_icon", password_confirmation: params[:password_confirmation])
    if @user.save 
      redirect_to("/user/sign_in")
    elsif @user.save == false
      render "/user/new"
    end
  end

  def account
    @current_user = User.find_by(id: session[:user_id]) 
  end

  def profile
    @current_user = User.find_by(id: session[:user_id]) 
  end

  def edit 
    @current_user = User.find_by(id: session[:user_id]) 
  end

  def update
    @current_user = User.find_by(id: params[:id])

    if params[:user_img]
      @current_user.user_img = "#{@current_user.id}.jpg"
      image = params[:user_img]
      File.binwrite("public/user_images/#{@current_user.user_img}", image.read)
    end

    if  params[:name].present? 
      if params[:name] != "" && params[:introduce] != ""
        if @current_user.update_attribute(:name, params[:name])  && @current_user.update_attribute(:introduce, params[:introduce])
          redirect_to("/user/profile")
        end
      else
        @current_user.errors.add(:base, "必須項目を入力してください")
        render("user/profile")
      end
    elsif params[:user].present?
      if @current_user.authenticate(params[:naw_password])
        if @current_user.update(account_params)
          redirect_to("/user/account")
        else
          render("user/edit")
        end
      else
        @current_user.errors.add(:base, "パスワードが違います")
        render("user/edit")
      end
    end
    
  end

  private
    def profile_params
      params.permit(:name, :introduce)
    end

    def account_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end