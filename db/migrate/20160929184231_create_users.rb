class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :account_id
      t.string :username
      t.string :avatar
      t.string :gravatar_url
      t.string :status
      t.string :permission
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
