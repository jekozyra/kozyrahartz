class CreateFirms < ActiveRecord::Migration
  def self.up
    create_table :firms do |t|
      t.string :title
      t.text :information

      t.timestamps
    end
  end

  def self.down
    drop_table :firms
  end
end
