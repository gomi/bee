class CreateAnswerProfiles < ActiveRecord::Migration
  def self.up
    create_table :answer_profiles do |t|
      t.integer :questionnarie_id, :null => false
      t.boolean :publication, :default => false, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :answer_profiles
  end
end
