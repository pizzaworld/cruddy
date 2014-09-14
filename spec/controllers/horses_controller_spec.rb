require 'rails_helper'

describe HorsesController do
  describe '#create' do
    describe 'when valid' do
      it 'saves and redirects to the horses path' do
        post :create, horse: attributes_for(:horse)
        expect(response).to redirect_to :horses
      end
    end

    describe 'when invalid' do
      it 're-renders the form' do
        post :create, horse: attributes_for(:invalid_horse)
        expect(response).to render_template :new
      end
    end
  end

  describe '#update' do
    let(:horse) { create :horse }

    describe 'when valid' do
      it 'saves and redirects to the horses path' do
        put :update, id: horse.id, horse: attributes_for(:horse)
        expect(response).to redirect_to :horses
      end
    end

    describe 'when invalid' do
      it 're-renders the form' do
        put :update, id: horse.id, horse: attributes_for(:invalid_horse)
        expect(response).to render_template :edit
      end
    end
  end
end
