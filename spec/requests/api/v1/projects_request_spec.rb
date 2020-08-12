# frozen_string_literal: true

RSpec.describe 'Project Management' do
  context :index do
    subject { get current_path, headers: headers }
    let(:current_path) { '/api/v1/projects' }

    context 'valid headers' do
      context "project don't exists" do
        let(:user) { create(:user) }
        let(:headers) { { 'token': user.authentication_token } }

        before { subject }

        it { expect(response).to have_http_status(:ok) }
        it { expect(parsed_response).to be_empty }
      end

      context 'project exists' do
        let(:task) { create(:task) }
        let(:headers) { { 'token': task.project.user.authentication_token } }
        let(:project_keys) { %w[id title schedule_date tasks] }
        let(:task_keys) { %w[id title description status schedule_date] }

        before { subject }

        it { expect(response).to have_http_status(:ok) }

        context :projects do
          it { expect(parsed_response).to_not be_empty }
          it { expect(parsed_response.last.keys).to match_array(project_keys) }
        end

        context :tasks do
          let(:tasks) { parsed_response.last['tasks'] }

          it { expect(tasks).to_not be_empty }
          it { expect(tasks.last.keys).to match_array(task_keys) }
        end
      end
    end
  end
end
