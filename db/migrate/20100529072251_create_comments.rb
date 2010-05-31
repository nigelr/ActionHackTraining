class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :blog
      t.string :first_name
      t.string :last_name
      t.text :message
      t.timestamps
    end
  end
  
  def self.down
    drop_table :comments
  end
end
