class VinylsController < ApplicationController

  # def index

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
  

  # def show

  def update
    vinyl = Vinyl.find_by(id: params["id"])
    vinyl.title = params["title"]
    vinyl.year = params["year"]
    vinyl.runtime = params["runtime"]
    vinyl.image_url = params["image_url"]
    vinyl.artist_id = params["artist_id"]
    vinyl.save

    if @vinyl.errors.any?
      flash[:error] = "'#{@vinyl.title}' was not updated."
    else
      flash[:success] = "'#{@vinyl.title}' was successfully updated."
    end

    redirect_to "/vinyls"
  end

  def destroy
    vinyl = Vinyl.find_by(id: params["id"])
    vinyl.delete
    flash[:success] = "'#{vinyl.title}' by #{Artist.find_by(id: vinyl.artist_id).name} 
      was successfully deleted."
    redirect_to "/vinyls"
  	
  end

end
