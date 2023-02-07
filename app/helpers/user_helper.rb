module UserHelper

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    User.find_by(id: session[:user_id]) if logged_in?
  end
end
