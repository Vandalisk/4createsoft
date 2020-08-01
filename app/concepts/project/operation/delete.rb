class Project::Delete < Trailblazer::Operation
  step Model(Project, :find)
  step -> (options, params:, **) { options['model'].destroy }
end
