require 'rails_helper'

describe Acme::Projects do
  context 'valid' do
    describe '#index' do
      it do
        get '/api/projects'

        expect(response.body).to eq({ ping: 'pong' }.to_json)
      end
    end

    describe '#create' do
      let(:params) { { project: { name: 'name', status: 'status', client_id: 3, created_at: '12/13/2020' } } }

      it do
        post '/api/projects', params: params

        expect(response.body).to eq({ message: 'project created' }.to_json)
      end
    end

    describe '#update' do
      let(:project) { create(:project) }
      let(:params) { { name: 'name', status: 'status' } }
      let(:id) { project.id }

      it do
        put "/api/projects/#{id}", params: params

        expect(response.body).to eq({ message: 'project updated' }.to_json)
      end
    end


    describe '#delete' do
      let(:project) { create(:project) }
      let(:id) { project.id }

      it do
        delete "/api/projects/#{id}"

        expect(response.body).to eq({ message: 'project deleted' }.to_json)
      end
    end
  end

  context 'invalid' do
  end
end
