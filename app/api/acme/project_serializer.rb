module Acme
  class ProjectSerializer
    def serialize(project)
      ProjectSerializer.new(project).serializable_hash
    end
  end
end
