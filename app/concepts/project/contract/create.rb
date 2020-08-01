module Project::Contract
  class Create < Reform::Form
    property :name
    property :status
    property :client_id

    validates :name, presence: true
    # validates :status, presence: true
    # validates :client_id, presence: true
  end
end
