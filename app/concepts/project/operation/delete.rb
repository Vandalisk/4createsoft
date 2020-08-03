class Project::Delete  < Project::Base
  step :authenticate!
  step Model(Project, :find)
  step -> (options, params:, **) { options['model'].destroy }
end
