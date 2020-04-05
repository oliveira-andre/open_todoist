class Tasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, default: ''
      t.text :description
      t.integer :status, default: 0, null: false
      t.datetime :schedule_date
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
