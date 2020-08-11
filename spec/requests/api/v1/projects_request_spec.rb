# frozen_string_literal: true

RSpec.describe 'Project Management' do
  context :index do
    subject { get current_path, headers: headers }
    let(:current_path) { '/api/v1/projects' }

    context 'valid headers and project exists' do
      let(:task) { create(:task) }
      let(:headers) { { 'token': task.project.user.authentication_token } }
      let(:project_keys) { %w[id title schedule_date tasks] }
      let(:task_keys) { %w[id title description status schedule_date] }

      before { subject }

      context :projects do
        it { expect(parsed_response).to_not be_empty }
        it { expect(parsed_response.last.keys).to match_array(project_keys) }
      end
    end
  end
end
