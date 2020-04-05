# frozen_string_literal: true

class Projects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false, default: ''
      t.integer :status, null: false, default: 0
      t.datetime :schedule_date

      t.timestamps
    end
  end
end
