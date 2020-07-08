class ApplicationController < ActionController::Base
  helper_method :current_user
helper_method :logged_in?

  private



def verified_user
    redirect_to '/' unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authorized_to_edit?(clip)
    clip.user == current_user
  end

  def redirect_if_not_logged_in
    redirect_to login_path if !logged_in?
  end

end
