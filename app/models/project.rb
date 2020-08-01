class Project < ApplicationRecord
  # enum status: { initial: 'initial', active: 'active', archived: 'archived' }
  belongs_to :client
end
