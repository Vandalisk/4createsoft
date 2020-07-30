class API < Grape::API
  # version 'v1', using: :path
  # version 'v1', using: :path, vendor: 'twitter'
  prefix :api
  format :json

  # version :v1 do
    # get('projects')  { run!(Project::Show, request) }
    # post('projects') { run!(Project::Create, request) }
  # end

  mount Acme::Projects
  # mount Acme::Clients
end
