class AddDateFieldToNewsEntries < ActiveRecord::Migration
  def self.up
    add_column :news_entries, :date, :date
  end

  def self.down
    remove_column :news_entries, :date
  end
end
