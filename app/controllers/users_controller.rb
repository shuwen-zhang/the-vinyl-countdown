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

    if not params["password"].empty?
      @user.password = params["password"]
    end
    if not params["password_confirmation"].empty?
      @user.password_confirmation = params["password_confirmation"]
    end

    if @user.save
      flash[:success] = "Account information successfully updated."
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = "Account information was not updated. ".html_safe
      # <br><li>
      flash[:error] << @user.errors.full_messages.join("<br><li>").html_safe
      redirect_to "/users/#{@user.id}/edit"
    end

  end


  def new
    @user = User.new
  end

  def destroy
    if params["id"] != session[:user_id].to_s
      flash[:error] = "Nice try!"
    else 
      user = User.find_by(id: params["id"])
      user.destroy
      flash[:success] = "Account was successfully deleted."
      reset_session  # need to log out
    end
    redirect_to "/users"
  end

  def create
    @user = User.create :email => params["email"], 
                        :password => params["password"],
                        :password_confirmation => params["password_confirmation"]
    if @user.errors.any?
      flash[:error] = "<br><li>".html_safe
      flash[:error] << @user.errors.full_messages.join("<br><li>").html_safe
      render "/users/new"
    else
      flash[:success] = "Thanks for signing up!"
      session[:user_id] = @user.id     # log the user in by setting session
      redirect_to "/vinyls"
    end
    # altnerative way
    # if @user.save
      # success
    # else
      # render, error message
  end


end
