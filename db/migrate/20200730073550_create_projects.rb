class CreateProjects < ActiveRecord::Migration[6.0]
  def up
    # execute <<-DDL
    #   CREATE TYPE project_status AS ENUM (
    #     'initial', 'active', 'archived'
    #   );
    # DDL

    create_table :projects do |t|
      t.string :name
      t.string :status
      # t.column :status, :project_status

      t.datetime :created_at, null: false
    end
  end

  def down
    drop_table :projects

    # execute 'DROP type project_status;'
  end
end
