require 'spec_helper'

describe PhotosController do

  describe 'GET#index' do
    it 'assigns the geojson variable' do
      pending "don't know how to deal with mongo style return"
      Photo.create(_id: '92', instagram_id: '92', url: 'http://example.com', username: 'honeybooboo', text:'whattttt',location: [1234, 4321])
      get :index
      expect(assigns(@geojson)).to eq Photo.to_geojson
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
