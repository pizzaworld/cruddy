require 'rails_helper'

describe 'Horses' do

  before do
    Horse.create name: 'Mister Salty Pretzel'
  end

  it 'lists horses on the index page' do
    visit '/horses'
    expect(page).to have_css 'h1', text: 'Horses'
    expect(page).to have_css '.name', text: 'Mister Salty Pretzel'
  end

end
