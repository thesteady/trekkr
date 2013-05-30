class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    puts "HEY CONTROLLER #{@photos.inspect}"
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.fetch_from_instagram(params[:search])
    redirect_to root_path
  end

  def callback
  end
end
