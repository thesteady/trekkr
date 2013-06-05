class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  field :url, type: String
  field :instagram_id, type: String
  field :username, type: String
  field :text, type: String
  field :height, type: Integer
  geo_field :location
  field :_id, type: String, default: ->{ instagram_id }
  spatial_index :location

  validates :url, presence: true
  validates :instagram_id, presence: true
  validates :username, presence: true
  validates :text, presence: true
  validates :instagram_id, uniqueness: true

  attr_accessible :url, :instagram_id, :height, :location, :text, :username


  def self.to_geojson
    photos = Photo.where(:location.exists => true)
    GeoJSON.build_feature_collection(photos)
  end

  def make_geojson_feature
   GeoJSON.build(self)
  end
end
