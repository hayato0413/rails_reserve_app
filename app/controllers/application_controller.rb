class ApplicationController < ActionController::Base
  before_action :access_control

  def access_control 
    if session[:user_id].nil?
      flash[:error] = "ログインしてください"
      redirect_to("/")
    end
  end

end
