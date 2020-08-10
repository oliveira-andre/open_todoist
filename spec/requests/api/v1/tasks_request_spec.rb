# frozen_string_literal: true

RSpec.describe 'Task Management', type: :request do
  let!(:project) { create(:project) }

  context :create do
    subject { post current_path, params: params, headers: headers }
    let(:current_path) { "/api/v1/projects/#{project.id}/tasks" }

    context 'invalid params' do
      let(:params) { { tasks: { title: nil } } }
      let(:headers) { { 'token' => project.user.authentication_token } }

      before { subject }

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(assigns(:task)).to_not be_valid }
    end

    context 'invalid headers' do
      let(:params) do
        { tasks: attributes_for(:task, project: project) }
      end
      let(:headers) { { 'token' => '' } }

      it { expect { subject }.to raise_error(StandardError) }
    end

    context 'valid with params and headers' do
      let(:params) do
        { tasks: attributes_for(:task, project: project) }
      end
      let(:headers) { { 'token' => project.user.authentication_token } }
      let(:keys_returned) { %w[id title description status schedule_date] }

      before { subject }

      it { expect(response).to have_http_status(:created) }
      it { expect(parsed_response.keys).to match_array(keys_returned) }
    end
  end
end
