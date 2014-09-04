require 'rails_helper'

describe 'People' do

  before do
    Person.create first: 'Paul', last: 'Revere'
  end

  it 'lists people on the index page' do
    visit '/people'
    expect(page).to have_css 'h1', text: 'People'
    expect(page).to have_css '.first', text: 'Paul'
    expect(page).to have_css '.last', text: 'Revere'
  end

end
