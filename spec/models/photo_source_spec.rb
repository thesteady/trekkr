require 'spec_helper'

describe PhotoSource do
  describe 'fetch_tagged_photos_for(tag, num_of_pages)' do
    context 'just one page of photos' do
      it 'parses a return from instagram' do
        # I would like to VCR this test.
        VCR.use_cassette "instagram/coloradotrail" do
          tag = 'coloradotrail'
          num_of_pages = 1
          results = PhotoSource.fetch_tagged_photos_for(tag, num_of_pages)
          first_result = results.first
          expect(results.count).to eq 13
          expect(first_result[:username]).to eq 'pebooth'
          expect(first_result[:url]).to include 'http://distilleryimage'
        end
      end
    end

    context 'multiple pages of photos' do
      it 'parses a return from instagram' do
        # I would like to VCR this test.
        VCR.use_cassette "instagram/coloradotrail_3pgs" do
          tag = 'coloradotrail'
          num_of_pages = 3
          results = PhotoSource.fetch_tagged_photos_for(tag, num_of_pages)
          first_result = results.first
          expect(results.count).to eq 46
          expect(first_result[:username]).to eq 'pebooth'
          expect(first_result[:url]).to include 'http://distilleryimage'
        end
      end
    end
  end
end
