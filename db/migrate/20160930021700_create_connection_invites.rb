class CreateConnectionInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :connection_invites do |t|
      t.references :profile, foreign_key: true
      t.references :connection_profile, foreign_key: true
      t.string :status
      t.datetime :invited_at
      t.datetime :reinvited_at
      t.datetime :rejected_at
      t.datetime :accepted_at
      t.datetime :approved_at
      t.integer :approved_by
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
