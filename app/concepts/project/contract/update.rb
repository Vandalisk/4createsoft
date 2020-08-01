module Project::Contract
  class Update < Reform::Form
    property :name
    property :status
    property :client_id
  end
end
