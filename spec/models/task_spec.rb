# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'validate presence of' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:project_id) }
  end

  context 'associations' do
    it { should belong_to(:project) }
  end
end
