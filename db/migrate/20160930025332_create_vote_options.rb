class CreateVoteOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :vote_options do |t|
      t.string :name
      t.string :description
      t.integer :value
      t.string :image
      t.references :widget_style, foreign_key: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
