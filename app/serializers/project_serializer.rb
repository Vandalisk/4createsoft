class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :status

  belongs_to :client
end
