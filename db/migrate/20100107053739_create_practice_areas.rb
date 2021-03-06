class CreatePracticeAreas < ActiveRecord::Migration
  def self.up
    create_table :practice_areas do |t|
      t.string :name
      t.text :information
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :practice_areas
  end
end
