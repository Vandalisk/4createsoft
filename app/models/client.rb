class Client < ApplicationRecord
  validates :name, uniqueness: true

  has_many :projects
end
