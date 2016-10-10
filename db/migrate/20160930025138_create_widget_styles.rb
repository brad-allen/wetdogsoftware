class CreateWidgetStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :widget_styles do |t|
      t.string :name
      t.string :description
      t.string :style_data
      t.string :status
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
