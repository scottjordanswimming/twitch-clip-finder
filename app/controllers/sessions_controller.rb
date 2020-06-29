class SessionsController < ApplicationController
#skip_before_action :redirect_if_not_logged_in
  def home
  end

  def new
    end

    def create

      if params[:provider] == 'github'
        @user = User.create_by_github_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else


        @user = User.find_by(username: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:error] = "Sorry, login info was incorrect. Please try again."
          redirect_to login_path
        end
      end
    end

end
