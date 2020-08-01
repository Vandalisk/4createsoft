require 'rails_helper'

describe Project::Create do
  describe 'valid' do
    subject(:service) { described_class.call({ params: params }) }

    describe 'should create a project' do
      let(:client) { create(:client) }
      let(:params) { { name: 'name', status: 'status', client_id: client.id } }

      it { expect(service.success?).to be_truthy }
      it { expect{ service }.to change { Project.count }.by(1) }
    end
  end

  describe 'invalid' do
  end
end
