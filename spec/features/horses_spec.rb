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
      visit '/horses'
      click_link 'Add Horse'
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

  describe 'deleting a horse' do
    before do
      Horse.create name: 'Porky'
  end

  it 'deletes a horse from a link on the index page' do
      visit "/horses"
      expect(page).to have_content 'Porky'
      click_link 'Delete'
      expect(current_path).to eql '/horses'
      expect(page).not_to have_content 'Porky'
  end
 end

  describe 'showing a horse' do
    before do
      Horse.create name: 'Cosimo de Medici'
    end

    it 'shows a horse' do
      visit "/horses"
      click_link 'Cosimo de Medici'
      expect(page).to have_css 'h1', text: 'Cosimo de Medici'
  end
 end
end
