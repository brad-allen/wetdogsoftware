class CreateCalendarEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :calendar_events do |t|
      t.string :name
      t.string :description
      t.string :event_contact
      t.datetime :event_start
      t.datetime :event_end
      t.boolean :all_day
      t.string :group_visibility, default: 'hidden'
      t.string :connection_visibility, default: 'read'
      t.string :users_visibility, default: 'hidden'
      t.string :public_visibility, default: 'hidden'
      t.string :rating, default: 'unrated'
      t.string :status
      t.references :profile, foreign_key: true
      t.references :group
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
