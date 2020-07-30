RSpec.shared_examples 'json result' do
  specify 'returns JSON' do
    api_call params
    expect { JSON.parse(response.body) }.not_to raise_error
  end
end

RSpec.shared_examples '400' do
  specify 'returns 400' do
    api_call params
    expect(response.status).to eq(400)
  end
end

RSpec.shared_examples 'contains error msg' do |msg|
  specify "error msg is #{msg}" do
    api_call params
    json = JSON.parse(response.body)
    expect(json['error_msg']).to eq(msg)
  end
end
