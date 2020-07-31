class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name

      t.datetime :created_at, null: false

      t.index :name, unique: true
    end
  end
end
