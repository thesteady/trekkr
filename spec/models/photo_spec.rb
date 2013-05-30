require 'spec_helper'

describe Photo do
  describe '.fetch_photos_from_instagram(tag)' do
    it 'returns recent photos based on the tag from instagram' do
      photos = Photo.fetch_from_instagram('coloradotrail')
      expect(photos.count).to eq 30
    end
  end
end
