# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Project Management' do
  context :index do
    subject { get current_path, headers: headers }
    let(:current_path) { '/api/v1/projects' }

    context 'invalid headers' do
      let(:header) { { 'token' => '' } }

      it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'valid headers' do
      let(:user) { create(:user) }
      let(:headers) { { 'token' => user.authentication_token } }

      context "project don't exists" do
        before { subject }

        it { expect(response).to have_http_status(:ok) }
        it { expect(parsed_response).to be_empty }
      end

      context 'project exists' do
        let!(:project) { create(:project, user: user) }
        let!(:task) { create(:task, project: project) }
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

  context :create do
    subject { post current_path, params: params, headers: headers }
    let(:current_path) { '/api/v1/projects' }

    context 'valid headers' do
      let(:user) { create(:user) }
      let(:headers) { { 'token' => user.authentication_token } }

      context 'invalid params' do
        let(:params) { { projects: { title: nil } } }

        before { subject }

        it { expect(response).to have_http_status(:unprocessable_entity) }
        it { expect(Project.all).to be_empty }
      end

      context 'valid params' do
        let(:params) { { projects: attributes_for(:project) } }
        let(:project_keys) { %w[id title schedule_date tasks] }

        before { subject }

        it { expect(response).to have_http_status(:created) }

        it { expect(parsed_response.keys).to match_array(project_keys) }
        it { expect(Project.active).to_not be_empty }
      end
    end
  end
end
