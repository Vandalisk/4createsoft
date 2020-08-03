require 'rails_helper'

describe Acme::Projects do
  context 'valid' do
    let(:project) { create(:project) }

    describe '#index' do
      it do
        get '/api/projects'

        expect(response.body).to eq({ message: 'projects' }.to_json)
      end
    end

    describe '#show' do
      it do
        get "/api/projects/#{project.id}"

        expect(response.body).to eq({ message: 'show project' }.to_json)
      end
    end

    describe '#create' do
      let(:client) { create(:client) }
      let(:params) { { project: project_params } }
      let(:project_params) { { name: 'name', status: 'status' } }

      describe 'with client in params' do
        let(:project_params) { super().merge(client: { name: 'name' }) }

        it do
          post '/api/projects', params: params

          expect(response.body).to eq({ message: 'project created' }.to_json)
        end
      end

      describe 'without client in params' do
        let(:expected_message) do
          { error: 'project[client] is missing, project[client][name] is missing' }
        end

        it do
          post '/api/projects', params: params

          expect(response.body).to eq(expected_message.to_json)
        end
      end
    end

    describe '#update' do
      let(:params) { { project: { status: 'status' } } }

      it do
        put "/api/projects/#{project.id}", params: params

        expect(response.body).to eq({ message: 'project updated' }.to_json)
      end
    end


    describe '#delete' do
      it do
        delete "/api/projects/#{project.id}"

        expect(response.body).to eq({ message: 'project deleted' }.to_json)
      end
    end
  end

  context 'invalid' do
  end
end
