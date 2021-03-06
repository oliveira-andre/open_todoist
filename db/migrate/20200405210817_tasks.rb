# frozen_string_literal: true

class Tasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, default: ''
      t.text :description
      t.integer :status, default: 0, null: false
      t.datetime :schedule_date
      t.integer :order, default: 0, null: false
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
