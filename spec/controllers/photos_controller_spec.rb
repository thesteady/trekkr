require 'spec_helper'

describe PhotosController do
  describe 'GET#index' do
    it 'assigns the photos variable' do
      pending
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
