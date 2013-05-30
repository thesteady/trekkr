class Photo
  include Mongoid::Document
  field :url, type: String


  Instagram.configure do |config|
    config.client_id = ENV['CLIENT_ID ']
    config.client_secret = ENV['CLIENT_SECRET']
    config.access_token = ENV['ACCESS_TOKEN']
  end

  def self.fetch_from_instagram(tag)
    Instagram.tag_recent_media('coloradotrail')
  end
end
