class Project::Create  < Project::Base
  step :authenticate!
  step Model( Project, :new )
  step :set_client
  step Contract::Build(constant: Project::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()

  private

  def set_client(options, params:, **)
    options['model'].client_id = Client.create_with(params[:client]).find_or_create_by(email: params[:client][:email]).id
  end
end
