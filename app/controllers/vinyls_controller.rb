class VinylsController < ApplicationController

  def index
    if session[:user_id] != nil
      @user = User.find_by(id: session[:user_id])
    end

    if params[:search].present?
      @vinyls = Vinyl.joins(:artist).where([
        "lower(vinyls.title) LIKE ? OR lower(artists.name) LIKE ?", 
        "%#{params[:search].downcase}%", 
        "%#{params[:search].downcase}%"])
    else
      @vinyls = Vinyl.all.limit(100).order('created_at desc')
    end

  end

  # def new

  def create
    @vinyl = Vinyl.create  :title => params["title"],
                  :year => params["year"],
                  :runtime => params["runtime"],
                  :image_url => params["image_url"],
                  :artist_id => params["artist_id"]

    if @vinyl.errors.any?
      flash[:error] = "Vinyl was not added because '#{@vinyl.title}' by 
      #{Artist.find_by(id: @vinyl.artist_id).name} already exists."
    else
      flash[:success] = "'#{@vinyl.title}' by #{Artist.find_by(id: @vinyl.artist_id).name} 
      was successfully added."
    end
    
    redirect_to "/vinyls"
  end

  # def edit
  

  def show
    if session[:user_id] != nil
      user = User.find_by(:id => session[:user_id])
      @collections = user.collections.order('name')
    end
  end


  def update
    @vinyl = Vinyl.find_by(id: params["id"])
    @vinyl.title = params["title"]
    @vinyl.year = params["year"]
    @vinyl.runtime = params["runtime"]
    @vinyl.image_url = params["image_url"]
    @vinyl.artist_id = params["artist_id"]
    @vinyl.save

    if @vinyl.errors.any?
      flash[:error] = "'#{@vinyl.title}' was not updated."
      redirect_to "/vinyls/#{@vinyl.id}/edit"

    else
      flash[:success] = "'#{@vinyl.title}' was successfully updated."
      redirect_to "/vinyls"
    end

  end

  def destroy
    vinyl = Vinyl.find_by(id: params["id"])
    vinyl.destroy
    flash[:success] = "'#{vinyl.title}' by #{Artist.find_by(id: vinyl.artist_id).name} 
      was successfully deleted."
    redirect_to "/vinyls"
  end


  # add vinyl to a user's collection
  def add
    @vinyl = Vinyl.find_by(id: params["vinyl_id"])
    @collection = Collection.find_by(id: params["collection_id"])

    if not @collection.nil?
      # Check that vinyl doesn't already exist in the collection
      if @collection.vinyls.exists?(@vinyl.id)
        flash[:notice] = "Vinyl already exists in the collection."
      else
        @collection.vinyls << @vinyl
        flash[:success] = "Vinyl was successfully added to the collection."
      end
    end
    
    redirect_to "/vinyls"
  end


end
