require 'rspec_helper'

describe 'Visitor Views the Home Page' do
  it 'displays a map' do
    visit root_path
    expect(response).to be_success
    expect(page).to have_selector('#map')
  end
end
