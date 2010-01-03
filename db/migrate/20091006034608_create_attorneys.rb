class CreateAttorneys < ActiveRecord::Migration
  def self.up
    create_table :attorneys do |t|
      t.string :name
      t.string :short_name
      t.string :role
      t.text :biography
      t.string :email
      t.integer :thumbnail_id
      t.timestamps
    end
  end

  def self.down
    drop_table :attorneys
  end
end
