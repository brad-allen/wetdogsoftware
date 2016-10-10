class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :calendar_event, foreign_key: true
      t.string :notification_text
      t.string :importance
      t.string :status
      t.integer :sleep_count
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
