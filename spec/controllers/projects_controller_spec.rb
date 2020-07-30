require 'rails_helper'

describe '/api/projects' do
  let(:params) { original_params }

  context 'invalid' do
    describe '#create' do
      context 'name already exist' do
      end

      context 'client_id does not exist' do
      end

      context 'status does not exist' do
      end

      context 'created_at is not a correct datetime' do
      end
    end

    describe '#show' do
      let(:original_params) { { name: name } }

      context 'name is missing' do
        let(:name) { nil }

        it_behaves_like '400'
        it_behaves_like 'json result'
        it_behaves_like 'contains error msg', 'name is missing'
      end
    end
    describe '#update' do
    end
    describe '#delete' do
    end
  end

  context 'valid' do
    context 'valid params' do
    end
  end
end
