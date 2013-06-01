require 'spec_helper'

describe Photo do
  describe 'valid photo' do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:instagram_id) }
    it { should validate_uniqueness_of(:instagram_id) }
  end

  describe 'get_new_photos' do
    it 'adds new photos to the db' do
      #whats a better way to test this?
      tag = 'coloradotrail'
      Photo.get_new_photos(tag)
      expect(Photo.all.count).to_not eq 0
    end
  end
end
