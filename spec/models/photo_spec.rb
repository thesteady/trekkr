require 'spec_helper'

describe Photo do
  describe 'valid photo' do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:instagram_id) }
    it { should validate_uniqueness_of(:instagram_id) }
  end

  describe 'get_new_photos' do
    it 'adds new photos to the db' do
      #whats a better way to test this?
      tag = 'coloradotrail'
      Photo.get_new_photos(tag)

      first_result = Photo.first
      expect(Photo.all.count).to_not eq 0
      # expect(first_result.username).to eq 'unospeeder'
      expect(first_result.text).to include('#coloradotrail')
    end
  end

  describe '.to_geojson' do
    it 'turns all of the photo objects that have coordinates into geojson response' do
      pending
      # geojson_example = { type: 'FeatureCollection', 
      #                     features: [{
      #                       type: 'Feature', 
      #                         properties: {
      #                             title: 'Washington, D.C.',
      #                             'marker-color': '#fff',
      #                             'marker-size': 'small',
      #                             url: 'http://placekitten.com/200/300'
      #                         },
      #                         geometry: {
      #                             type: 'Point',
      #                             coordinates: [-77.03201, 38.90065]
      #                         }
      #                     },
      #                     {
      #                         type: 'Feature',
      #                         properties: {
      #                             title: 'Baltimore, MD',
      #                             'marker-color': '#f00',
      #                             'marker-size': 'large',
      #                             url: 'http://placekitten.com/200/300'
      #                         },
      #                         geometry: {
      #                             type: 'Point',
      #                             coordinates: [-76.60767, 39.28755]
      #                         }
      #                     }]}
      #make a photo with coordinates
      #pass it through the method
      #what do I expect? a proper geojson response
      # expect(result).to eq geojson_example
    end

    it 'does not include objects that dont have coordinates' do
      pending
    end
  end
end
