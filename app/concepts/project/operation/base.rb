require 'jwt'

class Project::Base < Trailblazer::Operation
  def authenticate!(options, **)
    check_token(options)

    fail StandardError unless options[:token]
    fail StandardError unless options[:current_client]

    options[:current_client]
  rescue ::JWT::DecodeError
    fail StandardError
  end

  private

  def check_token(options)
    options[:token] = options[:request].headers['Authorization'].to_s.split(' ').last
    options[:current_client] = ::Knock::AuthToken.new(token: options[:token]).entity_for(Client)
  end
end
