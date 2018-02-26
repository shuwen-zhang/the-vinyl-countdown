class CollectionsController < ApplicationController

  # def index

  # def new

  def create
    @collection = Collection.create :name => params["name"],
                                    :user_id => session[:user_id]

    if @collection.errors.any?
      flash[:error] = "A collection of the same name already exists."
    else
      flash[:success] = "#{@collection.name} was successfully created."
    end
    
    redirect_to "/collections"
  end


  # make sure only owner of collection can edit
  def show
    @collection = Collection.find_by(id: params["id"])
    if @collection.user_id != session[:user_id]
      flash[:error] = "Nice try!"
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
    else
      flash[:success] = "Collection was successfully updated."
    end
    
    redirect_to "/collections"
  end


  def destroy
    @collection = Collection.find_by(id: params["id"])
    @collection.delete
    flash[:success] = "Collection successfully deleted."
    redirect_to "/collection"
  end

end
