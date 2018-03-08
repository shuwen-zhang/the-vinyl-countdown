class CollectionsController < ApplicationController

  def index
    # create a variable for all the collections that belongs to that user
    if session[:user_id] != nil
      @collections = Collection.where(user_id: session[:user_id]).all.order('name')
    end
  end


  def new
    @collection = Collection.new
  end


  def create
    @collection = Collection.create :name => params["name"],
                                    :user_id => session[:user_id]

    if @collection.errors.any?
      flash[:error] = "A collection of the same name already exists."
      render "collections/new"
    else
      flash[:success] = "#{@collection.name} was successfully created."
      redirect_to "/collections"
    end
    
  end


  # make sure only owner of collection can edit
  def show
    @collection = Collection.find_by(id: params["id"])
    if @collection.nil?
      flash[:error] = "Collection doesn't exist."
      redirect_to "/collections"
    elsif @collection.user_id != session[:user_id]
      flash[:error] = "You can only access your own collections."
      redirect_to "/collections"
    end
  end


  # make sure only owner of collection can edit
  def edit 
    @collection = Collection.find_by(id: params["id"])
    if @collection.user_id != session[:user_id]
      flash[:error] = "Nice try!"
      redirect_to "/collections"
    end
  end
  

  def update
    @collection = Collection.find_by(id: params["id"])
    @collection.name = params["name"]
    @collection.save

    if @collection.errors.any?
      flash[:error] = "Collection was not updated."
      redirect_to "/collections/#{@collection.id}/edit"
    else
      flash[:success] = "Collection was successfully updated."
      redirect_to "/collections"
    end

  end


  def destroy
    @collection = Collection.find_by(id: params["id"])
    @collection.destroy
    flash[:success] = "Collection successfully deleted."
    redirect_to "/collections"
  end

end
