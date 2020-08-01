require 'rails_helper'

describe Project::Index do
  subject(:service) { described_class.call() }

  let!(:projects) { create_list(:project, 2) }

  describe 'returns list of projects' do
    it { expect(service.success?).to be_truthy }
    it { expect(service['model']).to eq(projects) }
  end
end
