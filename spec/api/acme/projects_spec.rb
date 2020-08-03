require 'rails_helper'

describe Acme::Projects do
  context 'valid' do
    let(:client) { create(:client) }
    let(:project) { create(:project) }

    def with_auth_headers
      token =  Knock::AuthToken.new(payload: { sub: client.id }).token

      { 'Authorization' => "Bearer #{token}" }
    end

    describe '#index' do
      it do
        get '/api/projects', headers: with_auth_headers

        expect(response.body).to eq({ message: 'projects' }.to_json)
      end
    end

    describe '#show' do
      it do
        get "/api/projects/#{project.id}", headers: with_auth_headers

        expect(response.body).to eq({ message: 'show project' }.to_json)
      end
    end

    describe '#create' do
      let(:params) { { project: project_params } }
      let(:project_params) { { name: 'name', status: 'status' } }
      let(:client_params) { FactoryBot.attributes_for(:client) }

      describe 'with client in params' do
        let(:project_params) { super().merge(client: client_params) }

        it do
          post '/api/projects', params: params, headers: with_auth_headers

          expect(response.body).to eq({ message: 'project created' }.to_json)
        end
      end

      describe 'without client in params' do
        let(:expected_message) do
          { error: 'project[client] is missing, project[client][name] is missing' }
        end

        it do
          post '/api/projects', params: params, headers: with_auth_headers

          expect(response.body).to eq(expected_message.to_json)
        end
      end
    end

    describe '#update' do
      let(:params) { { project: { status: 'status' } } }

      it do
        put "/api/projects/#{project.id}", params: params, headers: with_auth_headers

        expect(response.body).to eq({ message: 'project updated' }.to_json)
      end
    end


    describe '#delete' do
      it do
        delete "/api/projects/#{project.id}", headers: with_auth_headers

        expect(response.body).to eq({ message: 'project deleted' }.to_json)
      end
    end
  end

  context 'invalid' do
  end
end
