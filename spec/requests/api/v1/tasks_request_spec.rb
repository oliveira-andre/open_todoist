# frozen_string_literal: true

RSpec.describe 'Task Management', type: :request do
  let!(:project) { create(:project) }

  context :create do
    let(:current_path) { "/api/v1/projects/#{project.id}/tasks" }

    context 'invalid params and valid headers' do
      let(:invalid_params) { { tasks: { title: nil } } }
      let(:valid_headers) { { 'token' => project.user.authentication_token } }

      before do
        post current_path, params: invalid_params, headers: valid_headers
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(assigns(:task)).to_not be_valid }
    end

    context 'valid with params and headers' do
      let(:valid_params) do
        { tasks: attributes_for(:task, project: project) }
      end
      let(:valid_headers) { { 'token' => project.user.authentication_token } }
      let(:keys_returned) { %w[id title description status schedule_date] }

      before do
        post current_path, params: valid_params, headers: valid_headers
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(parsed_response.keys).to match_array(keys_returned) }
    end
  end
end
