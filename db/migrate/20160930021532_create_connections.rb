class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.references :profile, foreign_key: true
      t.references :connection_profile, foreign_key: true
      t.string :status
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
