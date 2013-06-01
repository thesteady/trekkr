class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  field :url, type: String
  field :instagram_id, type: String
  field :height, type: Integer
  field :username, type: String
  field :text, type: String
  geo_field :location
  field :_id, type: String, default: ->{ instagram_id }
  spatial_index :location

  validates :url, presence: true
  validates :instagram_id, presence: true
  validates :instagram_id, uniqueness: true

  attr_accessible :url, :instagram_id, :height, :location


  #to geojson list:
  #get only the photos with coordinates

  #Photo.where(:location.exists => true)
  
  #take this array, turn it into geojson
  #send it to js for mapping (via controller)

  def self.get_new_photos(tag)
    results = PhotoSource.fetch_tagged_photos_for(tag)
    results.each { |result| Photo.create(result) }
  end
end
