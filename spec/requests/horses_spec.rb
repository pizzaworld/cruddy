require 'rails_helper'

describe 'Horses' do

  describe 'listing horses' do
    before do
      Horse.create name: 'Mister Salty Pretzel'
    end

    it 'lists horses on the index page' do
      visit '/horses'
      expect(page).to have_css 'h1', text: 'Horses'
      expect(page).to have_css '.name', text: 'Mister Salty Pretzel'
    end
  end

  describe 'creating a new horse' do
    it 'creates horses from a form' do
      visit '/horses/new'
      expect(page).to have_css 'h1', text: 'New Horse'
      fill_in 'Name', with: 'Peanut'
      click_button 'Save'
      expect(current_path).to eql '/horses'
      expect(page).to have_css '.name', text: 'Peanut'
    end

  end

  describe 'updating a horse' do
    let(:horse) { Horse.create name: 'Marcus Aurelius' }

    it 'updates horses from a form' do
      visit "/horses/#{horse.id}/edit"
      expect(page).to have_css 'h1', text: 'Edit Horse'
      fill_in 'Name', with: 'Pigpen'
      click_button 'Save'
      expect(current_path).to eql '/horses'
      expect(page).not_to have_css 'horses', text: 'Marcus Aurelius'
      expect(page).to have_css '.name', text: 'Pigpen'
    end
  end
end
