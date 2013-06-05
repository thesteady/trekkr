class PhotoService
  
  def initialize(tag, num_of_pages)
    results = PhotoSource.fetch_tagged_photos_for(tag, num_of_pages)
    PhotoService.make_new_pics(results)
  end

  def self.make_new_pics(parsed_results)
    parsed_results.each { |result| Photo.create(result) }
  end
end
