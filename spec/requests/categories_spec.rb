# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  # Initialize test data
  let!(:categories) { create_list(:category, 10) }
  let!(:category_id) { categories.first.id }

  # Get /category
  describe 'GET /categories' do
    before { get '/api/v1/categories' }
    it 'returns all categories' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'retuns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # POST /category
  describe 'POST /category' do
    context 'When the request is valid' do
      before { post '/api/v1/categories', params: { name: 'drama' } }
      it 'creates a category' do
        expect(json['name']).to eq('drama')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'When the request is invalid' do
      before { post '/api/v1/categories', params: { name: '' } }
      it 'returns a validation error message' do
        expect(response.body).to include('is too short (minimum is 3 characters)')
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end

    context 'When the request is valid' do
      before do
        post '/api/v1/categories',
             params: { name: 'dramaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' }
      end

      it 'returns a validation error message' do
        expect(response.body).to include('is too long (maximum is 60 characters)')
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  # DELETE /categories/:id
  describe 'DELETE /categories/:id' do
    before { delete "/api/v1/categories/#{category_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
