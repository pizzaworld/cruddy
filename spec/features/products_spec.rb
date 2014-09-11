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
      visit '/products'
      click_link 'Add Product'
      expect(page).to have_css 'h1', text: 'New Product'
      fill_in 'Name', with: 'Dog Trousers'
      click_button 'Save'
      expect(current_path).to eql '/products'
      expect(page).to have_css '#products', text: 'Dog Trousers'
    end
  end

  describe 'updating a product' do
    let(:product) { Product.create name: 'Snake Slacks' }

    it 'updates products from a form' do
      visit "/products/#{product.id}/edit"
      expect(page).to have_css 'h1', text: 'Edit Product'
      fill_in 'Name', with: 'Viper Vest'
      click_button 'Save'
      expect(current_path).to eql '/products'
      expect(page).not_to have_css '#products', text: 'Snake Slacks'
      expect(page).to have_css '#products', text: 'Viper Vest'
    end
  end

  describe 'deleting a product' do
    before do
      Product.create name: 'Dog Beer'
    end

  it 'deletes a product from a link on the index page' do
    visit "/products"
    expect(page).to have_content 'Dog Beer'
    click_link 'Delete'
    expect(current_path).to eql '/products'
    expect(page).not_to have_content 'Dog Beer'
  end
 end
end
