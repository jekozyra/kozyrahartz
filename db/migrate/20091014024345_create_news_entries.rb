class CreateNewsEntries < ActiveRecord::Migration
  def self.up
    create_table :news_entries do |t|
      t.string :title
      t.text :entry

      t.timestamps
    end
  end

  def self.down
    drop_table :news_entries
  end
end
