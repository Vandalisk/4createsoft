class Project::Create < Trailblazer::Operation
  step Model( Project, :new )
  # step Policy::Pundit( Application::Policy, :create? )
  step Contract::Build(constant: Project::Contract::Create)
  # step Contract::Validate()
  # step Contract::Persist()
  # fail Notifier::DBError

  # def test_step(options, params:, **)
  #   byebug
  # end

  # def to_json(*) # called in Grape's run!.
  #   '{}'
  # end
end
