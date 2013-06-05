require 'spec_helper'

describe PhotoService do
  describe '.new(tag, num_of_pages)' do
    it 'saves new pictures to the db' do
      VCR.use_cassette "instagram/kittens" do
        tag = 'kittens'
        num_of_pages = 1
        PhotoService.new(tag, num_of_pages)
        expect(Photo.count).to_not eq 0
      end
    end
  end

  describe '.make_new_pics(parsed_results)' do
    it 'takes parsed results and makes new photos' do
      results = [ { :instagram_id=>"43", :url=>"http://distilleryimage8.s3.amazonaws.com/ea6f8864ce2411e2ad9722000a9e2977_7.jpg", :height=>612, :username=>"pebooth", :text=>" #coloradotrail", :location=>[-107.931833333, 37.352833333]},
                  { :instagram_id=>"44", :url=>"http://distilleryimage7.s3.amazonaws.com/d59d9372cd8911e29fb622000aaa1012_7.jpg", :height=>612, :username=>"liveinvivid", :text=>"Rippin ", :location=>[-107.8723955, 37.413348467]},
                  { :instagram_id=>"42", :url=>"http://distilleryimage0.s3.amazonaws.com/91f7b048cc4f11e2a46122000a9d0dc6_7.jpg", :height=>612, :username=>"lukefalcone", :text=>"that time #coloradotrail #brothersweekend"}]
    expect{
            PhotoService.make_new_pics(results)
          }.to change(Photo, :count).by(3)
    end
  end
end

