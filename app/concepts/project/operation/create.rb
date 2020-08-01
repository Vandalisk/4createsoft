class Project::Create < Trailblazer::Operation
  step Model( Project, :new )
  step :set_client
  step Contract::Build(constant: Project::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()

  private

  def set_client(options, params:, **)
    options['model'].client_id = Client.find_or_create_by(params[:client]).id
  end
end
