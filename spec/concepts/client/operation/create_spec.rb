require 'rails_helper'

describe Client::Create do
  subject(:service) { described_class.call({ params: params }) }

  describe 'valid' do
    describe 'should create a client' do
      let(:params) { FactoryBot.attributes_for(:client) }

      it { expect(service.success?).to be_truthy }
      it { expect{ service }.to change { Client.count }.by(1) }
    end
  end

  describe 'invalid' do
  end
end
