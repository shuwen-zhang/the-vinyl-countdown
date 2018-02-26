class SessionsController < ApplicationController

  def destroy
    # cookies.delete(:user_id)
    #session[:user_id] = nil   # nulls key-value pair
    # cookies[:user_id] = nil
    reset_session   # more strict, gets rid of all key-pair values in that session
    redirect_to "/"
  end

  def create
    @user = User.find_by(email: params["email"])
    if @user != nil
      if @user.authenticate(params["password"])
        session[:user_id] = @user.id     
        redirect_to "/"
      else
        flash[:error] = "Looks like the email or password is wrong."
        redirect_to "/sessions/new"
      end
    else
      flash[:error] = "No users with that email exists."
      redirect_to "/sessions/new"
    end
  end

end
