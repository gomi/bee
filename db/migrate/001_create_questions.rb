class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :questionnarie_id, :null => false 
      t.integer :order, :null => false 
      t.string :sentences, :null => false 
      t.boolean :need, :null => false, :default => false 
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
