require 'spec_helper'

describe 'Visitor Views the Home Page' do
  it 'displays a map and photos' do
    Photo.create!(url: 'http://placekitten.com/200/300', height: 612, instagram_id: '12345', location:[43,34])

    visit root_path
    expect(page).to have_selector('.img')
    expect(page).to have_selector('.map')
  end
end
