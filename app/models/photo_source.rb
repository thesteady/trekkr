module PhotoSource

  Instagram.configure do |config|
    config.client_id = ENV['CLIENT_ID']
    config.client_secret = ENV['CLIENT_SECRET']
  end

  def self.fetch_tagged_photos_for(tag)
    results = Instagram.tag_recent_media(tag)
    parse_(results)
  end

  def self.long_lat(result)
    [result.location.longitude, result.location.latitude]
  end

  def self.parse_(results)
    parsed_results = results.collect do |result|
      a = { instagram_id: result.id,
        url: result.images.standard_resolution.url,
        height: result.images.standard_resolution.height,
        username: result.caption.from.username,
        text: result.caption.text,
        }
      
      a.merge( {location: long_lat(result)} ) if result.location.present?
    end
  end
end
