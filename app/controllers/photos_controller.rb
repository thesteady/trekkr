class PhotosController < ApplicationController

  def index
    @geojson = Photo.to_geojson
  end

  def callback
  end

  def show
    @photo = Photo.where( _id: params[:id]).first
  end
end
