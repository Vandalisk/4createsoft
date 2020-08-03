module Client::Contract
  class Create < Reform::Form
    property :name
    property :email
    property :password

    validates :name, presence: true
  end
end
