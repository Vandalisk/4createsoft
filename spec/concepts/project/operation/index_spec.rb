require 'rails_helper'

describe Project::Index do
  let!(:client) { create(:client) }
  let(:request_double) { double(headers: with_auth_headers(client)) }
  subject(:service) { described_class.call({ request: request_double }) }

  let!(:projects) { create_list(:project, 2, client: client) }

  describe 'returns list of projects' do
    it { expect(service.success?).to be_truthy }
    it { expect(service['model']).to eq(projects) }
  end
end
