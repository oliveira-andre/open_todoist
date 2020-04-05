class Scores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :points, null: false, default: 0
      t.integer :rank, null: false, default: 0

      t.timestamps
    end
  end
end
