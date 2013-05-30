require 'spec_helper'

describe 'Visitor Views the Home Page' do
  it 'displays a map and photos' do
    visit root_path
    expect(page).to have_selector('.img')
    expect(page).to have_selector('#map')
  end
end


describe 'Visit the New Page' do
 it 'has a search bar for searching instagram by tag' do
    visit new_photo_path
    expect(page).to have_selector(".form")
  end
end
