require 'spec_helper'

describe PhotosController do
  describe 'GET#index' do
    it 'assigns the photos variable' do
      photo = Photo.create(url: 'http://example.com')
      puts "WHAAAT #{photo.inspect}"
      get :index
      expect(assigns(@photos)).to eq [photo]
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET#show' do
    it 'assigns the photo variable' do
      photo = Photo.create(url: 'example.com', instagram_id: '12345', height: '644')
      expect(assigns(@photo)).to eq photo
    end


  end
end
