require 'spec_helper'

describe PhotoSource do
  describe 'fetch_tagged_photos_for' do
    context 'when the response from instagram is good' do
      it 'parses a return from instagram' do
        # I would like to VCR this test.
        #first result is nil???? why?
        tag = 'coloradotrail'
        results = PhotoSource.fetch_tagged_photos_for(tag)

        first_result = results.first
        expect(results.count).to_not be 0
        expect(first_result[:username]).to eq 'p1xc1n3'
        expect(first_result[:url]).to include 'http://distilleryimage'
      end
    end
  end
end
