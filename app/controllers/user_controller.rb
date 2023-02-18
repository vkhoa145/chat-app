class UserController < ApplicationController
  def new
    @user = User.new
  end

  def sign_up
    user = User.new(user_params)
    if user.save!
      # session[:user_id] = user.id
      redirect_to login_path
    end
  end

  def login
    
  end

  def sign_in
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
   session[:user_id] = nil
   current_user = nil
    redirect_to login_path
  end
  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end
