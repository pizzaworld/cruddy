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
      visit '/people'
      click_link 'Add Person'
      expect(page).to have_css 'h1', text: 'New Person'
      fill_in 'First', with: 'Paul'
      fill_in 'Last', with: 'Revere'
      click_button 'Save'
      expect(current_path). to eql '/people'
      expect(page). to have_css '.first', text: 'Paul'
      expect(page). to have_css '.last', text: 'Revere'
    end
  end

  describe 'updating a person' do
    let(:person) { Person.create first: 'Art', last: 'Pymp' }

    it 'updates people from a form' do
      visit "/people/#{person.id}/edit"
      expect(page).to have_css 'h1', text: 'Edit Person'
      fill_in 'First', with: 'Joey'
      fill_in 'Last', with: 'Hotdogz'
      click_button 'Save'
      expect(current_path).to eql '/people'
      expect(page).not_to have_content 'Art Pymp'
      expect(page).to have_css '.first', text: 'Joey'
      expect(page).to have_css '.last', text: 'Hotdogz'
    end
  end

  describe 'deleting a person' do
    before do
      Person.create first: 'Pug', last: 'Crusher'
    end

    it 'deletes a person from a link on the index page' do
      visit "/people"
      expect(page).to have_content 'Pug Crusher'
      click_link 'Delete'
      expect(current_path).to eql '/people'
      expect(page).not_to have_content 'Pug Crusher'
    end
  end

  describe 'showing a person' do
    let(:person) { Person.create first: 'Nikola', last: 'Tesla' }

    it 'shows a person' do
      visit "/people/#{person.id}"
      expect(page).to have_css 'h1', text: 'Nikola Tesla'
  end
 end

  describe 'showing a product' do
    let(:product) { Product.create name: 'Horse Hat' }

    it 'shows a product' do
      visit "/products/#{product.id}"
      expect(page).to have_css 'h1', text: 'Horse Hat'
    end
  end
end
