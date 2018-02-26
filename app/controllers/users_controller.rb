class UsersController < ApplicationController

 wrap_parameters :user, include: [:email, :password, :password_confirmation]


  def index
    @users = User.all.order("email")
  end

  def show
    # params["id"] is a string (params is always a string), while session[;user_id] is an int
    if params["id"] != session[:user_id].to_s
      flash[:error] = "Nice try!"
      redirect_to "/users"
    end
  end

  def edit
    if params["id"] != session[:user_id].to_s
      flash[:error] = "Nice try!"
      redirect_to "/users"
    end
  end


  def update
    @user = User.find_by(id: params["id"])
    @user.email = params["email"]
    @user.password = params["password"]
    if @user.save
      flash[:success] = "Account information successfully updated."
    else
      flash[:error] = "Account information was not updated.<br><li>".html_safe
      flash[:error] << @user.errors.full_messages.join("<br><li>").html_safe
    end
    redirect_to "/users"
  end

  def new
    @user = User.new
  end

  def destroy
    user = User.find_by(id: params["id"])
    user.delete
    flash[:success] = "Account was successfully deleted."
    reset_session  # need to log out
    redirect_to "/users"
  end

  def create
    @user = User.create :email => params["email"], 
                        :password => params["password"],
                        :password_confirmation => params["password_confirmation"]
    if @user.errors.any?
      flash[:error] = "<br><li>".html_safe
      flash[:error] << @user.errors.full_messages.join("<br><li>").html_safe

      # redirect_to "/users/new", notice: "Something went wrong"  
      # notice is cookie-based, stay within the response cycle
      render "/users/new"
    else
      flash[:success] = "Thanks for signing up!"
      session[:user_id] = @user.id     # log the user in by setting session
      redirect_to "/users"
    end
    # altnerative way
    # if @user.save
      # success
    # else
      # render, error message
  end


end
