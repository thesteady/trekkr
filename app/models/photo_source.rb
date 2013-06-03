module PhotoSource

  Instagram.configure do |config|
    config.client_id = ENV['CLIENT_ID']
    config.client_secret = ENV['CLIENT_SECRET']
  end

  def self.fetch_tagged_photos_for(tag)
    #I would really like to iterate over these pages
    #until there are no more to get.
    page_1 = Instagram.tag_recent_media(tag)
    clean_results = [parse_(page_1)]

    next_page_max_tag_id = page_1.pagination.next_max_tag_id
    
    page_count = 1

    until next_page_max_tag_id.nil? || page_count == 10 do
      page_count += 1
      puts "PAGE COUNT #{page_count}"
      #get the page of data
      results = Instagram.tag_recent_media(tag, :max_id => next_page_max_tag_id)
      #parse it, add it to the results
      clean_results << parse_(results)
      #set the new next page max id
      next_page_max_tag_id = results.pagination.next_max_tag_id
      puts "NEXT PAGE MAX TAG ID #{next_page_max_tag_id}"
    end


    # page_2_max_tag_id = page_1.pagination.next_max_tag_id
    # puts "PAGE 2: #{page_2_max_tag_id}"
    # page_2 = Instagram.tag_recent_media(tag, :max_id => page_2_max_tag_id ) unless page_2_max_tag_id.nil?
    # clean_results << parse_(page_2)
    

    # page_3_max_tag_id = page_2.pagination.next_max_tag_id
    # puts "PAGE 3: #{page_3_max_tag_id}"
    # page_3 = Instagram.tag_recent_media(tag, :max_id => page_3_max_tag_id ) unless page_3_max_tag_id.nil?
    
    # clean_results << parse_(page_3)

    # page_4_max_tag_id = page_3.pagination.next_max_tag_id
    # puts "PAGE 4: #{page_4_max_tag_id}"
    # page_4 = Instagram.tag_recent_media(tag, :max_id => page_4_max_tag_id ) unless page_4_max_tag_id.nil?
    
    # clean_results << parse_(page_4)

    clean_results.flatten

  end

  def self.parse_(results)
    parsed_results = results.collect do |result|
      a = { instagram_id: result.id,
        url: result.images.standard_resolution.url,
        height: result.images.standard_resolution.height,
        username: PhotoSource.get_username(result), #result.caption.from.username,
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
    result.caption && result.caption.text ? result.caption.text : "unavailable"
  end

  def self.get_username(result)
    result.caption && result.caption.from && result.caption.from.username ? result.caption.from.username : "unknown"
  end
end
