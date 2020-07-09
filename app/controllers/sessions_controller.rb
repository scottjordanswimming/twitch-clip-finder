class SessionsController < ApplicationController
#skip_before_action :verified_user, only: [:new, :create]

     def home
     end


      def new
        @user = User.new
      end

      def create
      #  binding.pry
        if @user = User.find_by(username: params[:user][:username])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  else
    render 'new'
  end
end


      # def omniauth
      #   @user = User.create_by_github_omniauth(auth)
      #
      #   session[:user_id] = @user.id
      #   redirect_to user_path(@user)
      # end

      def destroy
        session.clear
        redirect_to '/'
      end

      # private
      #
      #   def auth
      #     request.env['omniauth.auth']
      #   end
      #
end
