class SessionsController < ApplicationController
#skip_before_action :verified_user, only: [:new, :create]

     def home
     end


      def new
    @user = User.new
      end

def create

if auth_hash = request.env["omniauth.auth"]

  oauth_email = request.env["omniauth.auth"]["info"]["email"]
  oauth_name = request.env["omniauth.auth"]["info"]["nickname"]

  if user = User.find_by(:email => oauth_email)
session[:user_id] = user.id
redirect_to 'home'
else
  user = User.new(:username => oauth_name, :email => oauth_email, :password => SecureRandom.hex)
if user.save
  session[:user_id] = user.id
    redirect_to user_path(user.id)
  else raise user.errors.full_messages.inspect
  end
end
     else
    user = User.find_by(:email => params["user"]["email"])
    if user && user.authenticate(params["user"]["password"])

      session[:user_id] = user.id

      redirect_to user_path(user.id)
    else
      render 'sessions/new'
      end
    end
  end




      def omniauth
        @user = User.create_by_github_omniauth(auth)

        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end

      def destroy
        session.clear
        redirect_to '/'
      end

      private

        def auth
          request.env['omniauth.auth']
        end

end
