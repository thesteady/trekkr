require 'spec_helper'

describe Photo do
  describe '.fetch_photos_from_instagram(lat, long)' do
    context 'when there are photos' do
      it 'adds photos to the database from an instagram search' do
        photos = Photo.fetch_from_instagram(39.725145, -104.982712)

        expect(Photo.count).to eq 19
      end

      context 'when there are NO photos' do
        it 'does not add any photos or break' do
          pending
        end
      end
    end
  end
end
