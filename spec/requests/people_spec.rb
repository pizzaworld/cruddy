require 'rails_helper'

describe 'People' do

  describe 'Listing people' do
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

  describe 'Creating a new person' do
    it 'creates people from a form' do
      visit '/people/new'
      expect(page).to have_css 'h1', text: 'New Person'
      fill_in 'First', with: 'Paul'
      fill_in 'Last', with: 'Revere'
      click_button 'Save'
      expect(current_path). to eql '/people'
      expect(page). to have_css '.first', text: 'Paul'
      expect(page). to have_css '.last', text: 'Revere'

    end
  end


end
