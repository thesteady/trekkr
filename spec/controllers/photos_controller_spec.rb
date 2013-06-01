require 'spec_helper'

describe PhotosController do
  let(photo) {Photo.create(_id: '92', instagram_id: '92', url: 'http://example.com', username: 'honeybooboo', text:'whattttt',location: [1234, 4321])}

  describe 'GET#index' do
    it 'assigns the photos variable' do
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
      get :show, id: photo._id
      expect(assigns(@photo)).to eq photo
    end

    it 'renders the show template' do
      get :show, id: photo._id
      expect(response).to render_template(:show)
    end
  end
end
