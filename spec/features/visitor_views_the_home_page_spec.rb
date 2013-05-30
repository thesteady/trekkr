require 'spec_helper'

describe 'Visitor Views the Home Page' do
  it 'displays a map and photos' do
    #this needs photos!
    
    visit root_path
    expect(page).to have_selector('.img')
    expect(page).to have_selector('#map')
  end
end
