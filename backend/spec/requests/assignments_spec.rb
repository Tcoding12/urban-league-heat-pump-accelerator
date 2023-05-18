# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/assignments', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Assignment. As you add validations to Assignment, be sure to
  # adjust the attributes here as well.

  let!(:user) { FactoryBot.create(:user) }
  let!(:home) { FactoryBot.create(:home) }
  let!(:surveyor) do
    FactoryBot.create(:surveyor, user:) do |surveyor|
      FactoryBot.create_list(:assignment, 1, surveyors: [surveyor])
      home.update(assignment: surveyor.assignments[0], visit_order: 1)
    end
  end

  let(:valid_attributes) do
    {
      surveyors: [surveyor],
      group: 'all-stars',
      region_code: 1
    }
  end

  let(:invalid_attributes) do
    {
      group: 1,
      region_code: 'invalid_region'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Assignment.create! valid_attributes
      get assignments_url, as: :json
      expect(response).to be_successful
    end

    it 'can filter based on a surveyor' do
      Assignment.create! valid_attributes
      get assignments_url, params: { surveyor_id: surveyor.id }, as: :json
      expect(response.body).to match(/#{home.id}/)
    end

    it 'can filter based on a surveyor' do
      Assignment.create! valid_attributes
      get assignments_url, params: { surveyor_id: (surveyor.id + 1) }, as: :json
      expect(response.body).to match('[]')
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get assignment_url(surveyor.assignments.first), as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_assignment_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Assignment' do
        expect do
          post assignments_url, params: { assignment: valid_attributes }, as: :json
        end.to change(Assignment, :count).by(1)
      end

      it 'redirects to the created assignment' do
        post assignments_url, params: { assignment: valid_attributes }, as: :json
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Assignment' do
        expect do
          post assignments_url, params: { assignment: invalid_attributes }, as: :json
        end.to change(Assignment, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post assignments_url, params: { assignment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          surveyor_ids: []
        }
      end

      it 'updates the assignment' do
        assignment = Assignment.create! valid_attributes
        patch assignment_url(assignment), params: { assignment: new_attributes }, as: :json
        assignment.reload
        expect(response).to be_successful
        expect(JSON.parse(response.body)['surveyor_ids']).to match_array([])
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch assignment_url(surveyor.assignments.first), params: { assignment: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested assignment' do
      expect do
        delete assignment_url(surveyor.assignments.first), as: :json
      end.to change(Assignment, :count).by(-1)
    end

    it 'returns a valid response' do
      delete assignment_url(surveyor.assignments.first), as: :json
      expect(response).to be_successful
    end
  end
end
