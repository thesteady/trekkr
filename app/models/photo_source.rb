module PhotoSource

  Instagram.configure do |config|
    config.client_id = ENV['CLIENT_ID']
    config.client_secret = ENV['CLIENT_SECRET']
  end

  def self.fetch_tagged_photos_for(tag)
    puts "RETRIEVING PAGE 1"
    page_1 = Instagram.tag_recent_media(tag)
    clean_results = [ parse_(page_1) ]

    next_page_max_tag_id = page_1.pagination.next_max_tag_id
    page_count = 1

    until next_page_max_tag_id.nil? || page_count == 10 do
      page_count += 1
      puts "RETRIEVING PAGE #{page_count}"
      results = Instagram.tag_recent_media(tag, :max_id => next_page_max_tag_id)
      clean_results << parse_(results)
      next_page_max_tag_id = results.pagination.next_max_tag_id
    end
    clean_results.flatten
  end

  def self.parse_(results)
    parsed_results = results.collect do |result|
      a = { instagram_id: result.id,
        url: result.images.standard_resolution.url,
        height: result.images.standard_resolution.height,
        username: PhotoSource.get_username(result),
        text: PhotoSource.get_text(result),
        }
      a.merge!( {location: long_lat(result)} ) if result.location.present?
      a 
    end
    parsed_results
  end

  def self.long_lat(result)
    [result.location.longitude, result.location.latitude]
  end

  def self.get_text(result)
    begin
      result.caption.text
    rescue
      'unavailable'
    end
  end

  def self.get_username(result)
    begin
      result.caption.from.username
    rescue
      'unknown'
    end
  end
end
