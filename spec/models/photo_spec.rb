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
      VCR.use_cassette "instagram/coloradotrail" do
        tag = 'coloradotrail'
        Photo.get_new_photos(tag)

        first_result = Photo.first
        expect(Photo.all.count).to eq 152
        expect(first_result.username).to eq 'brittlauren16'
        expect(first_result.text.downcase).to include('#coloradotrail')
      end
    end
  end

  describe '.to_geojson' do
    it 'turns all of the photo objects that have coordinates into geojson response' do
      geojson_example = { type: 'FeatureCollection', 
                          features: [{
                            type: 'Feature', 
                              properties: {
                                  title: 'honeybooboo',
                                  url: 'http://placekitten.com/200/300',
                                  description: 'what',
                                  'marker-color'=> '#543511',
                                  'marker-size'=> 'small'
                              },
                              geometry: {
                                  type: 'Point',
                                  coordinates: [-77.03201, 38.90065]
                              }
                          },
                          {
                              type: 'Feature',
                              properties: {
                                  title:'anonymoose',
                                  url: 'http://placekitten.com/200/200',
                                  description: 'huh',
                                  'marker-color'=> '#543511',
                                  'marker-size'=> 'small'
                              },
                              geometry: {
                                  type: 'Point',
                                  coordinates: [-76.60767, 39.28755]
                              }
                          }]}

      Photo.create(username: 'honeybooboo', url: 'http://placekitten.com/200/300', text: 'what', instagram_id: '111', _id: '111', location:[-77.03201, 38.90065] )
      Photo.create(username: 'anonymoose', url: 'http://placekitten.com/200/200', text: 'huh', instagram_id: '222', _id: '222', location:[-76.60767, 39.28755] )
      Photo.create(username: 'hey you', url: 'http://placekitten.com/300/300', text: 'who', instagram_id: '333', _id: '333')
      result = Photo.to_geojson
      expect(result).to eq geojson_example.to_json
    end
  end
end
