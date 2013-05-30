class Photo
  include Mongoid::Document
  field :url, type: String
  field :instagram_id, type: String
  field :height, type: Integer
  field :_id, type: String, default: ->{ instagram_id }

  attr_accessible :url, :instagram_id, :height

  validates :url, presence: true
  validates :instagram_id, presence: true
  validates :instagram_id, uniqueness: true
  validates :lat, presence: true
  validates :long, presence: true


  Instagram.configure do |config|
    config.client_id = ENV['CLIENT_ID']
    config.client_secret = ENV['CLIENT_SECRET']
    # config.access_token = ENV['ACCESS_TOKEN']
  end

  def self.fetch_from_instagram(lat, long)
    results = Instagram.media_search(lat, long)
    results.each do |result|
      Photo.create(
                instagram_id: result.id,
                url: result.images.standard_resolution.url,
                height: result.images.standard_resolution.height,
                lat: result.location.latitude,
                long: resut.location.longitude
              )
    end
  end
end
