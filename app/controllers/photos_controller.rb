class PhotosController < ApplicationController

  def index
    @photos = Photo.all.to_a
    @geojson = Photo.to_geojson

    puts "#{@geojson.inspect}"
  end

  def callback
  end

  def show
    @photo = Photo.where( _id: params[:id]).first
  end
end
