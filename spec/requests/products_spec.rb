require 'rails_helper'

describe 'Products' do

  describe 'Listing products' do
    before do
      Product.create name: 'Cat Pants'
    end

    it 'displays product names' do
      visit '/products'
      expect(page).to have_css 'h1', text: 'Products'
      expect(page).to have_css '#products', text: 'Cat Pants'
    end
  end

  describe 'creating a new product' do
    it 'creates a new product from a form' do
      visit '/products/new'
      expect(page).to have_css 'h1', text: 'New Product'
      fill_in 'Name', with: 'Dog Trousers'
      click_button 'Save'
      expect(current_path).to eql '/products'
      expect(page).to have_css '#products', text: 'Dog Trousers'
    end
  end

end
