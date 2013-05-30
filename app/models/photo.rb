class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Geospatial

  field :url, type: String
  field :instagram_id, type: String
  field :height, type: Integer
  geo_field :location
  field :_id, type: String, default: ->{ instagram_id }

  attr_accessible :url, :instagram_id, :height, :location

  validates :url, presence: true
  validates :instagram_id, presence: true
  validates :instagram_id, uniqueness: true
  validates :location, presence: true

  spatial_index :location

  Instagram.configure do |config|
    config.client_id = ENV['CLIENT_ID']
    config.client_secret = ENV['CLIENT_SECRET']
  end

  def self.fetch_from_instagram(lat, long)
    results = Instagram.media_search(lat, long)
    results.each do |result|
      Photo.create(
                instagram_id: result.id,
                url: result.images.standard_resolution.url,
                height: result.images.standard_resolution.height,
                location: [result.location.longitude, result.location.latitude]
              )
    end
  end
end
