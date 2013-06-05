require 'spec_helper'

describe PhotoSource do
  describe 'fetch_tagged_photos_for' do
    context 'when the response from instagram is good' do
      it 'parses a return from instagram' do
        # I would like to VCR this test.
        VCR.use_cassette "instagram/coloradotrail" do
          tag = 'coloradotrail'
          results = PhotoSource.fetch_tagged_photos_for(tag)
          first_result = results.first
          expect(results.count).to eq 152
          expect(first_result[:username]).to eq 'liveinvivid'
          expect(first_result[:url]).to include 'http://distilleryimage'
        end
      end
    end
  end
end
