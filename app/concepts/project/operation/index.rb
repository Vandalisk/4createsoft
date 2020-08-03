class Project::Index < Project::Base
  step :authenticate!
  step -> (options, **) { options['model'] = Project.where(client_id: options[:current_client].id) }
end
