class ArtistsController < ApplicationController

  # def index

  # def new

  def create
    @artist = Artist.create  :name => params["name"]

    if @artist.errors.any?
      flash[:error] = "Artist was not added because someone 
      of the same name already exists."
      render "/artists/new"
    else
      flash[:success] = "#{@artist.name} was successfully added."
      redirect_to "/artists"
    end

  end

  # def edit
  

  # def show

  def update
    @artist = Artist.find_by(id: params["id"])
    @artist.name = params["name"]
    @artist.save

    if @artist.errors.any?
      flash[:error] = "Artist was not updated."
      redirect_to "/artists/#{@artist.id}/edit"
    else
      flash[:success] = "#{@artist.name} was successfully updated."
      redirect_to "/artists"
    end

  end

  def destroy
    @artist = Artist.find_by(id: params["id"])
    @artist.destroy
    flash[:success] = "#{@artist.name} was successfully deleted."
    redirect_to "/artists"
  end

end