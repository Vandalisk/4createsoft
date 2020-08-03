class Project::Update < Project::Base
  step :authenticate!
  step Model(Project, :find)
  step :update!

  def update!(options, params:, model:, **)
    model.update_attributes(params[:project])
  end
end
