require 'rails_helper'

describe Project::Delete do
  subject { described_class.call({ params: params}) }

  context 'valid' do
    let(:params) { { id: project.id } }

    describe 'when id exists' do
      let!(:project) { create(:project) }

      it { expect(subject.success?).to be_truthy }
      it { expect { subject }.to change { Project.count }.by(-1) }
    end
  end

  context 'invalid' do
    describe 'when id does not exist' do
      let(:params) { { id: -1 } }

      it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
