class Photo
  include Mongoid::Document
  field :url, type: String

  def self.fetch_from_instagram(tag)
    Instagram.tag_recent_media('coloradotrail')
  end
end
