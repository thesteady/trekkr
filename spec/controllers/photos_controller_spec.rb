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

  describe 'GET#new' do
    it 'renders the new form template' do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe "POST#create" do
    it 'retrieves new photos from instagram' do
      pending
      # post :create, search: 'flower'

    end

    it 'redirects to the show page' do
      pending
      # expect(response).to redirect_to(photo_show_path(@photo))
    end
  end
end
