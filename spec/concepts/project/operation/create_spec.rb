require 'rails_helper'

describe Project::Create do
  subject(:service) { described_class.call({ params: params }) }

  describe 'valid' do
    context 'with existing client' do
      describe 'should create a project' do
        let!(:client) { create(:client) }
        let(:project_params) { { name: 'name', status: 'status' } }
        let(:client_params) { { name: client.name } }
        let(:params) { project_params.merge(client: client_params) }

        it { expect(service.success?).to be_truthy }
        it { expect{ service }.to change { Project.count }.by(1) }
        it { expect{ service }.not_to change { Client.count } }

        it do
          subject

          project = Project.find_by(name: project_params[:name])

          expect(project.status).to eq(project_params[:status])
          expect(project.client_id).to eq(client.id)
        end
      end
    end

    context 'with new client' do
      describe 'should create a project' do
        let(:project_params) { { name: 'name', status: 'status' } }
        let(:client_params) { { name: 'name' } }
        let(:params) { project_params.merge(client: client_params) }

        it { expect(service.success?).to be_truthy }
        it { expect{ service }.to change { Project.count }.by(1) }
        it { expect{ service }.to change { Client.count }.by(1) }

        it do
          subject

          project = Project.find_by(name: project_params[:name])

          expect(project.status).to eq(project_params[:status])
          expect(project.client.name).to eq(client_params[:name])
        end
      end
    end
  end

  describe 'invalid' do
  end
end
