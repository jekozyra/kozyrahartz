class AddUrlFieldToFirm < ActiveRecord::Migration
  def self.up
    add_column :firms, :url, :string
  end

  def self.down
    remove_column :firms, :url
  end
end
