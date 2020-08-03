class Project::Show < Project::Base
  step :authenticate!
  step Model(Project, :find)
end
