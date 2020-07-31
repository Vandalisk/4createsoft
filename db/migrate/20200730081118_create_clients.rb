class CreateClients < ActiveRecord::Migration[6.0]
  def up
    create_table :clients do |t|
      t.string :name

      t.datetime :created_at, null: false

      t.index :name, unique: true
    end
  end

  def down
    drop_table :clients
  end
end
