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
end
