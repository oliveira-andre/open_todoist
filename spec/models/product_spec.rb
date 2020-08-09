# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'validate presence of' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:status) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:tasks) }
  end
end
