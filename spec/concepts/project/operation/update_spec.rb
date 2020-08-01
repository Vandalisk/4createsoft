require 'rails_helper'

describe Project::Update do
  describe 'valid' do
    subject(:service) { described_class.call({ params: params }) }

    describe 'should update a project' do
      let(:old_status) { 'old status' }
      let(:new_status) { 'new status' }
      let(:project) { create(:project, status: old_status) }
      let(:params) { { id: project.id, project: { status: 'new status' } } }

      it { expect(service.success?).to be_truthy }
      it { expect{ service }.to change { project.reload.status }.from(old_status).to(new_status) }
    end
  end

  describe 'invalid' do
  end
end
