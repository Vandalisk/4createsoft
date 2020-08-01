class Project::Index < Trailblazer::Operation
  step -> (options, **) { options['model'] = Project.all }
end
