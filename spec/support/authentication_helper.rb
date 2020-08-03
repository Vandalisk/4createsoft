module AuthenticationHelper
  def with_auth_headers(client)
    token =  Knock::AuthToken.new(payload: { sub: client.id }).token

    { 'Authorization' => "Bearer #{token}" }
  end
end
