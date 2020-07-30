# class Project::Create < Trailblazer::Operation
#   step Model( Project, :new )
#   # step Policy::Pundit( Application::Policy, :create? )
#   step Contract::Build(constant: Project::Contract::Create)
#   step Contract::Validate()
#   step Contract::Persist()
#   fail Notifier::DBError
# end
