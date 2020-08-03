class AddPasswordToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :email, :string, null: false
    add_column :clients, :password_digest, :string
    add_column :clients, :last_login, :datetime

    add_index :clients, :email, unique: true
  end
end
