class CreateQuetionnarie < ActiveRecord::Migration
  def self.up
    create_table :questionnaries do |t|
      t.string :title, :null => false 
      t.string :description
      t.date :limit, :null => false 
      t.string :publication, :null => false 
      t.string :note
      t.timestamp
    end
  end

  def self.down
    drop_table :questionnarie
  end
end
