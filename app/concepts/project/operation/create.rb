class Project::Create < Trailblazer::Operation
  step Model( Project, :new )
  step Contract::Build(constant: Project::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
end
