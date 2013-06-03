class PhotosController < ApplicationController

  def index
    @geojson = Photo.to_geojson
  end

  def callback
  end
end
