class Photo
  include Mongoid::Document
  field :url, type: String


  Instagram.configure do |config|
    config.client_id = ENV['CLIENT_ID']
    config.client_secret = ENV['CLIENT_SECRET']
    # config.access_token = ENV['ACCESS_TOKEN']
  end

  def all
    all.to_a
  end

  def self.fetch_from_instagram(lat, long)
    results = Instagram.media_search(lat, long)
    results.each do |result|
      Photo.create(
                instagram_id: result.id,
                url: result.images.standard_resolution.url,
                height: result.images.standard_resolution.height
              )
    end
  end
end
